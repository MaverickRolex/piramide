class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    
  end

  def edit

  end

  def create
    @user = User.new(user_params)

    if @user.admin === 1
      @user.admin = true
    else
      @user.admin = false
    end

    if @user.save
      flash.now[:notice] = "Usuario creado."
      redirect_to @user
    else
      flash.now[:alert] = "Error al crear el usuario."
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if current_user.id === @user.id || current_user.admin
      if @user.admin === 1
        @user.admin = true
      else
        @user.admin = false
      end
      if @user.update(user_params)
        flash.now[:notice] = "Los cambios han sido guardados."
        redirect_to @user
      else
        render :show, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "No puede modificar otros usuarios, contacte al administrador."
      render :show
    end
  end

  def destroy
    if current_user.id === @user.id || current_user.admin
      if @user.destroy
        flash.now[:notice] = "Usuario eliminado con exito."
        redirect_to action: "index"
      else
        flash.now[:alert] = "No tiene permisos para eliminar usuarios, contacte al administrador."
        render :show
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :address, :admin, :authenticity_token )
  end
end

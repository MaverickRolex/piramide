class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = current_user.print_children
    @users = @users.sort_by { |user| user.level }
    @rates = Rate.all
  end

  def new
    @user = User.new
  end

  def show
    @rates = Rate.all
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

    @user.registrer_id = current_user.id

    if current_user.children.length < 3
      @user.parent_id = current_user.id
      @user.level = current_user.level + 1
    end

    if @user.save
      flash[:notice] = "Usuario creado."
      redirect_to @user
    else
      flash[:alert] = "Error al crear el usuario."
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if !@user.level.present?
      user_parent = User.find_by(id: user_params[:parent_id])
      @user.level = user_parent.level + 1
    end

    if current_user.id === @user.id || current_user.admin
      if @user.admin === 1
        @user.admin = true
      else
        @user.admin = false
      end
      if @user.update(user_params)
        flash[:notice] = "Los cambios han sido guardados."
        redirect_to @user
      else
        render :show, status: :unprocessable_entity
      end
    else
      flash[:alert] = "No puede modificar otros usuarios, contacte al administrador."
      render :show
    end
  end

  def destroy
    if current_user.id === @user.id || current_user.admin
      if @user.destroy
        flash[:notice] = "Usuario eliminado con exito."
        redirect_to action: "index"
      else
        flash[:alert] = "No tiene permisos para eliminar usuarios, contacte al administrador."
        render :show
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :address, :admin, :registrer_id, :parent_id, :authenticity_token)
  end
end

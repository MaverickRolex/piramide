class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_current_sale, only: [:new]
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin
      @sales = Sale.all
    else
      @sales = Sale.where(user_id: current_user.id)
    end
  end

  def new
    @product = Product.find(params[:product_id]) if params[:product_id]
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
    if @sale.update(sale_params)
      flash[:notice] = "Los cambios han sido guardados."
      redirect_to action: "index"
    else
      flash[:alert] = "Error al editar el producto."
      render :new
    end
  end

  def destroy
    if @sale.destroy
      flash[:notice] = "Venta cancelada."
      redirect_to action: "index"
    end
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:total_amount, :total_balance, :provider_balance, :status, :provider_status)
  end

end

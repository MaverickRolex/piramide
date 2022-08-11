class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_current_sale, only: [:new, :show]
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
    @sales = Sale.all
  end

  def new
    @product = Product.find(params[:product_id]) if params[:product_id]
  end

  def create
  end

  def show
    @product = Product.find(params[:product_id]) if params[:product_id]
  end

  def edit
  end

  def update
    binding.pry
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

  def sales_params
    params.require(:sales).permit(:total_amount, :total_balance )
  end

end

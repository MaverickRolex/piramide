class SaleProductsController < ApplicationController

  def create
    sale_product = SaleProduct.new(sale_product_params)
    sale_product.total_price = sale_product.quantity * sale_product.product.price
    sale_product.save
    redirect_to new_sale_path
  end

  def destroy
    @sale_product = SaleProduct.find(params[:id])
    if @sale_product.destroy
      flash.now[:notice] = "Producto eliminado con exito."
      redirect_to new_sale_path
    end
  end
  
  private
  
  def sale_product_params
    params.require(:sale_product).permit(:sale_id, :product_id, :quantity)
  end

end

class SaleProductsController < ApplicationController
  before_action :find_current_sale, only: [:cancel]

  def create
    if params[:sale_product][:product_id].present? && params[:sale_product][:quantity].present?
      sale_product = SaleProduct.new(sale_product_params)
      sale_product.total_price = sale_product.quantity * sale_product.product.price
      if sale_product.save
        product = Product.find(params[:sale_product][:product_id])
        product.stock = product.stock - params[:sale_product][:quantity].to_i
        product.save
      end
      redirect_to new_sale_path
    else
      flash[:alert] = "No se pudo agregar el articulo, verifique el codigo y la cantidad de unidades"
      redirect_to new_sale_path
    end
  end

  def destroy
    @sale_product = SaleProduct.find(params[:id])
    if @sale_product.destroy
      product = Product.find(@sale_product.product_id)
      product.stock = product.stock + @sale_product.quantity
      product.save
      flash[:notice] = "Producto eliminado con exito."
      redirect_to new_sale_path
    end
  end

  def show_remove
    @sale_product = SaleProduct.find(params[:sale_product_id])
    if @sale_product.destroy && current_user.admin
      @sale_product.sale.total_amount = @sale_product.sale.sale_products_total
      @sale_product.sale.save
      flash[:notice] = "Producto eliminado con exito."
      redirect_to sale_path(@sale_product.sale)
    end
  end

  def cancel
    @sale_products = SaleProduct.where(sale_id: current_sale.id)
    @sale_products.each do |sale_product|
      product = Product.find(sale_product.product_id)
      product.stock = product.stock + sale_product.quantity
      product.save
    end 
    @sale_products.destroy_all
    current_sale.destroy
    redirect_to sales_path
  end
  
  private
  
  def sale_product_params
    params.require(:sale_product).permit(:sale_id, :product_id, :quantity)
  end

end

module SalesHelper

  def current_sale
    @current_sale
  end

  def products_list
    @products = Product.all
  end
end

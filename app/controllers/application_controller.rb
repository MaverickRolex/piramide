class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :product_best_seller

  def find_current_sale
    return unless current_user

    @current_sale = current_user.pending_sales.last || current_user.sales.create
  end

  def current_sale
    @current_sale
  end


  def product_best_seller
    products = Product.all.order(sold: "desc")
    @best_seller = products.first
  end

  def best_seller
    @best_seller
  end

end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def find_current_sale
    return unless current_user

    @current_sale = current_user.pending_sales.last || current_user.sales.create
  end

  def current_sale
    @current_sale
  end

end

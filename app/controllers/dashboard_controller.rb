class DashboardController < ApplicationController
  def index
    @rates = Rate.all
    @messages = Message.where(readed: false)
    if current_user.weekly_sale_total > 473
      flash[:notice] = "Felicidades has conseguido la meta de esta semana."
    end
    @weekly_benefits = 0
  end

  private

  def product_top_sale
  end
end

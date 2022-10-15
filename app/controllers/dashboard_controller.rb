class DashboardController < ApplicationController
  def index
    @rates = Rate.all
    if current_user.weekly_sale_total > 473
      flash[:notice] = "Felicidades has conseguido la meta de esta semana."
    end
  end
end

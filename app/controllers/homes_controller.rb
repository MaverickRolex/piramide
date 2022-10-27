class HomesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @rates = Rate.all
    @products = Product.all
  end
end

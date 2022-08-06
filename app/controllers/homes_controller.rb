class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :find_current_sale
end

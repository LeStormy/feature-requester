class DashboardController < ApplicationController
  #before_action :authenticate_user!

  def index
    redirect_to Board.first
  end

end

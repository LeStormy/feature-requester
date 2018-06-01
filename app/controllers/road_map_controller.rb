class RoadMapController < ApplicationController
  before_action :set_current_user

  def show
  end

  def update
  end

  def index
    @boards = Board.all
  end

  def create
  end
end

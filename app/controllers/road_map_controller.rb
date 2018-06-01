class RoadMapController < ApplicationController
  before_action :set_current_user
  def show

  end

  def update

  end

  def index
    @boards = Hash[Board.all.pluck(:id, :title)]
    @planned = Post.where(status: :planned)
    @in_progress = Post.where(status: :in_progress)
    @completed = Post.where(status: :completed)
  end

  def create

  end
end

class BoardsController < ApplicationController
  def show
    @boards = Board.all
    @posts = Board.find(params[:id]).posts.order(created_at: :desc)
  end
end

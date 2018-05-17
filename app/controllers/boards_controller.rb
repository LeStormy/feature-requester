class BoardsController < ApplicationController
  def show
    @boards = Hash[Board.all.pluck(:id, :title)]
    @posts = Board.find(params[:id]).posts.order(created_at: :desc)
    @users = Hash[User.pluck(:id, :name)]
    all_voted_posts = Vote.distinct.pluck(:post_id)
    @vote_count = {}
    all_voted_posts.each do |p|
      @vote_count[p] = Vote.where("post_id = ?", p).count
    end
    @voted_posts = Vote.where(user_id: 3).pluck(:post_id)
  end
end

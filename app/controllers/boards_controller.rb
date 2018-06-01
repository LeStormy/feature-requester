class BoardsController < ApplicationController
  before_action :set_current_user
  def show
    @boards = Hash[Board.all.pluck(:id, :title)]
    @posts = Board.find(params[:id]).posts
      .where.not("posts.status = (?)", "completed")
      .where("posts.title LIKE ? OR posts.short_description LIKE ?", "%#{params["search"]}%", "%#{params["search"]}%")
      .order(:status, created_at: :desc)
    @users = Hash[User.pluck(:id, :name)]
    all_voted_posts = Vote.distinct.pluck(:post_id)
    @vote_count = {}
    all_voted_posts.each do |p|
      @vote_count[p] = Vote.where("post_id = ?", p).count
    end
    if @current_user.present?
      @voted_posts = Vote.where(user_id: @current_user.id).pluck(:post_id)
    end
  end
end

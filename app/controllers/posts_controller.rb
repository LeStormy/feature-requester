class PostsController < ApplicationController
  def create
    post = Post.new
    post.assign_attributes(params.require(:post).permit([
     :title,
     :short_description,
     :description,
     :board_id,
     :user_id
    ]))
#    authorize post
    post.save!

    redirect_back fallback_location: boards_path
  end

  def show
    @boards = Board.all
    @post = Post.find_by(id: params[:id].to_i)
    @voters = User.joins(:votes).where("votes.post_id = ?", params[:id]).distinct.pluck(:name)
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc)
    @users = Hash[User.pluck(:id, :name)]
  end

  def new

  end


end

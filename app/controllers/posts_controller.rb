class PostsController < ApplicationController
  before_action :set_current_user

  def create
    post = Post.new
    post.assign_attributes(params.require(:post).permit([
     :title,
     :short_description,
     :description,
     :status,
     :board_id,
     :user_id
    ]))
#    authorize post
    post.save!
    Vote.create!(user_id: params[:post][:user_id], post_id: post.id)
    redirect_back fallback_location: boards_path
  end

  def show
    @boards = Board.all
    @post = Post.find(params[:id])
    @voters = User.joins(:votes).where("votes.post_id = ?", params[:id]).distinct.pluck(:name, :thumbnail)
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc)
    @users = Hash[User.pluck(:id, :name)]
    @thumbnails = Hash[User.pluck(:id, :thumbnail)]
  end

  def new

  end

  def edit
    id =
      if params[:id].present?
        params[:id]
      else
        params[:post_id]
      end
    @boards = Board.all
    @post = Post.find(id)
    @voters = User.joins(:votes).where("votes.post_id = ?", id).distinct.pluck(:name, :thumbnail)
    @comments = Comment.where(post_id: @post.id).order(created_at: :desc)
    @users = Hash[User.pluck(:id, :name)]
    @thumbnails = Hash[User.pluck(:id, :thumbnail)]
    render 'edit'
  end

  def remove_milestone
    post = Post.find(params[:post_id])
    post.update!(milestones: post.milestones - [params[:milestone]])

    redirect_back fallback_location: board_path(id: post.board_id)
  end

  def update
    post = Post.find(params[:id])
    post.update!(params.require(:post).permit(:status, :description, milestones: []))

    redirect_to post_path(id: params[:id])
  end

  def complete
    post = Post.find(params[:post_id])
    if post.milestones.include?("Done!")
      post.update!(status: 'completed')
    else
      post.update!(status: 'completed', milestones: post.milestones + [ "Done!"] )
    end

    redirect_back fallback_location: board_path(id: post.board_id)
  end

  def plan
    post = Post.find(params[:post_id])
    post.update!(status: 'planned', milestones: post.milestones - ["Done!"])

    redirect_back fallback_location: board_path(id: post.board_id)
  end

  def start
    post = Post.find(params[:post_id])
    if post.milestones.include?("Started")
      post.update!(status: 'in_progress', milestones: post.milestones - ["Done!"])
    else
      post.update!(status: 'in_progress', milestones: post.milestones + [ "Started"] - ["Done!"] )
    end

    redirect_back fallback_location: board_path(id: post.board_id)
  end

  def destroy
    post = Post.find(params[:id])
    board = post.board_id
    post.destroy!
    redirect_to board_url(id: board)
  end

end

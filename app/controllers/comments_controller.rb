class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.assign_attributes(params.require(:comment).permit([
     :message,
     :post_id,
     :user_id
    ]))
#    authorize comment
    comment.save!

    redirect_back fallback_location: boards_path
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_back fallback_location: boards_path
  end

end

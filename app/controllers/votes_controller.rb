class VotesController < ApplicationController
  def create
    vote_try = Vote.find_by(post_id: params["vote"][:post_id], user_id: params["vote"][:user_id])
    if (vote_try.present?)
      Vote.destroy(vote_try.id)
    else

      vote = Vote.new
      vote.assign_attributes(params.require(:vote).permit([
       :post_id,
       :user_id
      ]))
  #    authorize vote
      vote.save!
    end

    redirect_back fallback_location: boards_path
  end

  def show

  end

  def new

  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  def unset_current_user
    session[:user_id] = nil

    redirect_to road_map_index_path
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def slack_redirect
    raw_response = Net::HTTP.get URI("https://slack.com/api/oauth.access?client_id=#{ENV["SLACK_CLIENT_ID"]}&client_secret=#{ENV["SLACK_CLIENT_SECRET"]}&code=#{params[:code]}&redirect_uri=#{slack_redirect_url}")
    response = JSON.parse(raw_response)

    user_slack_id = response["user"]["id"]
    user = User.find_or_create_by(slack_id: user_slack_id) do |u|
      u.name = response["user"]["name"]
      u.profile_picture = response["user"]["image_48"]
      u.thumbnail = response["user"]["image_32"]
    end
    session[:user_id] = user.id

    redirect_to road_map_index_path
  end
end

Rails.application.routes.draw do
  devise_for :admin_users
  ActiveAdmin.routes(self)
  root to: "road_map#index"

  resources :boards
  resources :posts do
    put :start
    put :plan
    put :complete
    put :edit
  end
  resources :comments
  resources :votes
  resources :road_map

  delete :unset_current_user, to: "application#unset_current_user"

  get :slack_redirect, to: "application#slack_redirect"
end

Rails.application.routes.draw do
  devise_for :user
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "road_map#index"

  resources :boards
  resources :posts do
    put :start
    put :plan
    put :complete
  end
  resources :comments
  resources :votes
  resources :road_map
end

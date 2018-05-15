Rails.application.routes.draw do
  devise_for :user
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "dashboard#index"

  resources :boards
end

Rails.application.routes.draw do

  root "static_pages#index"
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :users, only: :show
  resources :static_pages
  resources :rooms
end

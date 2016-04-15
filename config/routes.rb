Rails.application.routes.draw do

  root "static_pages#index"
  devise_for :users
  resources :static_pages
  resources :rooms
end

Rails.application.routes.draw do

  devise_for :users
  root "static_pages#index"

  get  "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :static_pages
  resources :rooms

end

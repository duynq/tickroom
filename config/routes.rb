Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root "rooms#index"

  resources :users do
    resources :rooms, only: :create
  end

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  resources :static_pages
  resources :rooms, only: [:show, :update, :index, :new] do
    resources :photos
  end
  resources :photos

  resources :users, only: :show
  resources :static_pages, only: :index
  resources :rooms, only: [:show, :create, :update, :new]
end

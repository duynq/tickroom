Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root "static_pages#index"

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent"  => "mailbox#sent",  as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :users, only: :show
  resources :static_pages, only: :index
  resources :rooms, only: [:show, :create, :update, :new]
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
end

Rails.application.routes.draw do
  root to: "lists#index"
  resources :movie, only: [:show]
  resources :lists, only: [:index, :show, :create, :new] do
    resources :bookmarks, only: [:create, :new]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: [:destroy]
  resources :reviews, only: :destroy
end

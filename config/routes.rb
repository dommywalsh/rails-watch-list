Rails.application.routes.draw do
  resources :lists, only: [:index, :show, :create, :new] do
    resources :bookmarks, only: [:create, :new]
  end
  resources :bookmarks, only: [:destroy]
end

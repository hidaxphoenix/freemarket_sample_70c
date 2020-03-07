Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    collection {get "confirm"}
      resources :items, only: [:show]
  end
end

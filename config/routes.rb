Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root "meetings#index"
  resources :users, only: [:edit, :update]
  resources :meetings, only: [:index, :new, :create, :destroy] do
    resources :contents, only: [:index, :new, :create]
  end
  get 'contents/:id', to: 'contents#checked'
end

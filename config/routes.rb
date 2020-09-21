Rails.application.routes.draw do
  devise_for :users
  root "meetings#index"
  resources :users, only: [:edit, :update]
  resources :meetings, only: [:index, :new, :create] do
    resources :contents, only: [:index, :new, :create]
  end
end

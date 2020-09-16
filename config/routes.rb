Rails.application.routes.draw do
  devise_for :users
    root "users#edit"
  resources :users, only: [:edit, :update]
end

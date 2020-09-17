Rails.application.routes.draw do
  get 'meetings/index'
  devise_for :users
    root "meetings#index"
  resources :users, only: [:edit, :update]
end

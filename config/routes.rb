Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
 }

  root to:"stores#index"
  resources :stores, only: [:new, :create, :edit, :update, :destroy]
  resources :users, only: [:show]
end

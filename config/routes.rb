Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }

  root to:"stores#index"

  resources :stores, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show] do
    get :favorites, on: :collection
  end
end

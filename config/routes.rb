Rails.application.routes.draw do
  get 'stores/index'
  devise_for :users

  root to:"stores#index"
end

Rails.application.routes.draw do
  devise_for :users

  # devise might handle all we need here
  # resources :users
  
  root 'welcome#index'

  get 'rulebook', to: 'rulebook#index'
end

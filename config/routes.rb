Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  # devise might handle all we need here
  resources :users, only: [:show, :index, :edit, :update]
  
  authenticated :user do
    root 'rulebook#index'
  end
  
  root 'welcome#index'

  get 'homepage', to: 'welcome#index'

  get 'rulebook', to: 'rulebook#index'
end

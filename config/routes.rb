Rails.application.routes.draw do
  resources :cards
  resources :rulebooks
  devise_for :users, :controllers => { registrations: 'registrations' }

  # devise might handle all we need here
  resources :users, only: [:show, :index, :edit, :update]
  
  authenticated :user do
    root 'rulebooks#current'
  end
  
  root 'welcome#index'

  get 'homepage', to: 'welcome#index'

  get 'rulebook', to: 'rulebooks#current'
end

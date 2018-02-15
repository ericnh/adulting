Rails.application.routes.draw do
  resources :users
  root 'welcome#index'

  get 'rulebook', to: 'rulebook#index'
end

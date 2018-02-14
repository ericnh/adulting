Rails.application.routes.draw do
  root 'welcome#index'

  get 'rulebook', to: 'rulebook#index'
end

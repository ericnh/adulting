Rails.application.routes.draw do
  root 'welcome#index'

  get 'rulebook/index'
end

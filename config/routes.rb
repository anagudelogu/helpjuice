Rails.application.routes.draw do
  resources :articles, only: [:index]
  resources :users, only: [:create]

  delete '/logout', to: 'users#delete_session'

  root 'articles#index'
end

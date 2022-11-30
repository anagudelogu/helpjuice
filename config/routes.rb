Rails.application.routes.draw do
  resources :articles, only: [:index]
  resources :users, only: [:create]

  root 'articles#index'
end

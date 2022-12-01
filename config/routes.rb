Rails.application.routes.draw do
  resources :articles, only: [:index] do
    collection { post :search, to: 'queries#search' }
  end

  resources :users, only: [:create]

  delete '/logout', to: 'users#delete_session'

  root 'articles#index'
end

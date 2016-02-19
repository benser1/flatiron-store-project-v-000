Rails.application.routes.draw do

  devise_for :users
  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: [:show]
  resources :carts
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  # delete '/users/sign_out' => 'devise/sessions#destroy'  ### this could be almost right?
  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end

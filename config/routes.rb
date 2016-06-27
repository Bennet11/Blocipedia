Rails.application.routes.draw do

  get 'users/show'

  devise_for :users

  resources :wikis

  resources :users, only: [:show, :index] do
    post 'premium_to_standard' => 'users#premium_to_standard', as: :premium_to_standard
  end 

  resources :charges, only: [:new, :create]

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'
end

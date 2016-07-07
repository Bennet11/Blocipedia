Rails.application.routes.draw do

  get 'users/show'

  devise_for :users

  resources :wikis
  
  resources :users, only: [:show, :index] do
    post 'publicize_wiki' => 'users#publicize_wiki', as: :publicize_wiki
  end

  resources :charges, only: [:new, :create]

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'
end

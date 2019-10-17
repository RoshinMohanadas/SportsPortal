Rails.application.routes.draw do
  resources :matches
  resources :teammembers
  # resources :teams
  resources :events
  resources :eventgroups
  resources :users
  get 'welcome/index'
  root 'welcome#index'

  get 'teams/', to: 'teams#index'
  get 'teams/basicinfo', to: 'teams#basicinfo'
  post 'teams/createbasicinfo', to: 'teams#createbasicinfo'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

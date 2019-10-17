Rails.application.routes.draw do
  resources :teammembers
  resources :teams
  resources :events
  resources :eventgroups
  resources :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

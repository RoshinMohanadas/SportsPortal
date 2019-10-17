Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :events
  resources :event_groups
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

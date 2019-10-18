Rails.application.routes.draw do
  get 'session/new'
  get 'homepage/home'
  root 'homepage#home'
  resources :matches
  #resources :teammembers
  # resources :teams
  resources :events
  resources :eventgroups
  resources :users
  get 'welcome/index'

  get    'login'   => 'session#new'
  post   'login'   => 'session#create'
  delete 'logout'  => 'session#destroy'


  get 'teams/', to: 'teams#index'
  get 'teams/show', to: 'teams#show'
  get 'teams/basicinfo', to: 'teams#basicinfo'
  get 'teams/editbasicinfo', to: 'teams#editbasicinfo'
  post 'teams/createbasicinfo', to: 'teams#createbasicinfo'
  post 'teams/createteam', to: 'teams#createteam'
  patch 'teams/updatebasicinfo', to: 'teams#updatebasicinfo'

  get 'teammembers/newmember', to: 'teammembers#newmember'
  post 'teammembers/createmember', to: 'teammembers#createmember'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  #get "reports/userdownload_pdf" => "reports#userdownload_pdf", :as => 'userdownload_pdf'
  get "reports/userdownload_pdf"
  get "reports/egdownload_pdf"
  resources :newsfiles
  
  get 'session/new'
  get 'homepage/home'
  root 'homepage#home'
  resources :matches

  resources :matches do
     member do
       get 'addresult'
       
  end
end
  #resources :teammembers
  # resources :teams
  resources :events
  resources :eventgroups
  resources :users
  get 'welcome/index'

  get    'login'   => 'session#new'
  post   'login'   => 'session#create'
  delete 'logout'  => 'session#destroy'
  get 'about' => 'homepage#about'
  get 'facilities' => 'homepage#facilities'
  get 'contact' => 'homepage#contact'
  get 'homegallery' => 'homepage#gallery'


  get 'teams/', to: 'teams#index'
  get 'teams/show', to: 'teams#show'
  get 'teams/basicinfo', to: 'teams#basicinfo'
  get 'teams/editbasicinfo', to: 'teams#editbasicinfo'
  post 'teams/createbasicinfo', to: 'teams#createbasicinfo'
  post 'teams/createteam', to: 'teams#createteam'
  get 'teams/edittravelplan', to: 'teams#edittravelplan'
  patch 'teams/updatetravelplan', to: 'teams#updatetravelplan'
  patch 'teams/updatebasicinfo', to: 'teams#updatebasicinfo'
  post 'teams/approve', to: 'teams#approve'
  post 'teams/reject', to: 'teams#reject'
  get 'teams/transport', to: 'teams#transport'
  post 'teams/arrangetransport', to: 'teams#arrangetransport'
  post 'teams/rejecttravelplan', to: 'teams#rejecttravelplan'

  get 'teammembers/newmember', to: 'teammembers#newmember'
  get 'teammembers/edit', to: 'teammembers#edit'
  patch 'teammembers/update', to: 'teammembers#update'
  post 'teammembers/createmember', to: 'teammembers#createmember'
  delete 'teammembers/destroy', to: 'teammembers#destroy'

  
  # For details on the DSL available  within this file, see https://guides.rubyonrails.org/routing.html
end

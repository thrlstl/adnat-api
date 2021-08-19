Rails.application.routes.draw do
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  delete '/leave', to: 'organization_users#destroy'
  resources :shifts
  resources :organization_users
  resources :organizations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

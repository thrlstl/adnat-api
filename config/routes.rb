Rails.application.routes.draw do
  post '/auth', to: 'auth#create'
  resources :shifts
  resources :organization_users
  resources :organizations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

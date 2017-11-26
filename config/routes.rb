Rails.application.routes.draw do
  devise_for :users
  
  resources :projects
  resources :clients
  resources :professional_services
  resources :trades
  resources :materials
  resources :businesses
  resources :staffs

  root "static_pages#home"
end

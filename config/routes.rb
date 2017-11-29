Rails.application.routes.draw do
  devise_for :users
  
  resources :projects
  resources :project_sub_categories
  resources :clients
  resources :professional_services
  resources :trades
  resources :materials
  resources :businesses
  resources :staffs
  resources :expenses

  root "static_pages#home"
end

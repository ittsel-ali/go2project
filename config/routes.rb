Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  
  resources :projects do 
    resources :project_tasks do 
      resources :project_sub_tasks
    end
  end
  
  resources :project_sub_categories
  resources :clients
  resources :professional_services
  resources :trades
  resources :materials
  resources :businesses
  resources :staffs
  resources :expenses

  resources :images


  root "static_pages#home"
end

Rails.application.routes.draw do
  
    namespace :administrator do
    root :to => 'application#index'
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'




  get "sign_up" => "devise/registrations#new", :as => "sign_up"
  devise_for :members
  
  root :to => "store_details#index"
  
  resources :foods do
      resources :comments
  end
  
  resources :store_details do
    resources :addons
    resources :foods 
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

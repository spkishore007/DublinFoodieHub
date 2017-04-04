Rails.application.routes.draw do
  
  
    namespace :administrator do
    root :to => 'application#getdata'
    get 'application/getdata' =>'application#getdata'
    post 'application/showdata' =>'application#showdata'
    get 'application/sales'
    get 'application/order'
    get 'application/food'
    get 'application/customer'
    get 'application/extra'
    get 'application/index'
    end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'




  get "sign_up" => "devise/registrations#new", :as => "sign_up"
  devise_for :members

  root :to => "store_details#index"
  resources :profiles
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  resources :products do
      resources :comments
  end
  
  resources :store_details do
    resources :addons
    resources :products do
    resources :comments
    post "make_pizza" => "products"
    delete "reset_topping" => "products"
  end
  end
  
  resources :products
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  root to: "products#index"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
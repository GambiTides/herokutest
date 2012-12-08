Rails3BootstrapDeviseCancan::Application.routes.draw do  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  match :admin, :to => 'users#index'
  devise_for :users
  resources :users
  match 'map' => "users#map"
  match 'account' => "users#show"
  match 'clinic' => "users#clinic"
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
end
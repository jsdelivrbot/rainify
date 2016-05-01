Rails.application.routes.draw do
  root :to => 'home#index'
  
  controller :sessions do
    get 'login' => :new, :as => :login
    post 'login' => :create, :as => :authenticate
    get 'auth/shopify/callback' => :callback
    get 'logout' => :destroy, :as => :logout
  end

  resources :shops do 
    member do
      post 'toggle'
    end
  end

  get '/payments/sign_up_recurring', to: 'payments#sign_up_recurring'
  resources :payments
  end

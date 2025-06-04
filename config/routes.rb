Rails.application.routes.draw do
  devise_for :customers
  devise_for :users
  root to: "products#index"
  resources :products, except: [:index]

  resources :orders do 
    resources :order_items, except: [:destroy]
  end

  resources :order_items, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :listings
  post 'payments/webhook', to: 'payments#webhook'
  get 'payments/success', to: 'pages#payment_success'
  get 'search', to: "listings#search"
  post 'payments/session', to: 'payments#create_stripe_session', as: 'new_stripe_session'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

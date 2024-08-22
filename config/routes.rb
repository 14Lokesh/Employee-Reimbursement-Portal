Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "users#new"
  resources :users
  resources :sessions
  resources :companies
  resources :employees
  resources :reimbursement_claims

  get '/auth/:provider/callback' => 'sessions#omniauth'


end

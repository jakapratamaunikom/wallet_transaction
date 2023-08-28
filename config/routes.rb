Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'transactions#index'

  resources :withdraws
  resources :topups
  resources :transfers
  resources :transactions
  resources :stocks
  resources :accounts
  resources :customers
end

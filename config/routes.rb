Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :charges, only: [:new, :create]
  resources :line_items
  resources :carts
  resources :instruments
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'instruments#index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

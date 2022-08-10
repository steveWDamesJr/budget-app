# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show] do
    resources :groups, only: [ :new, :create, :show, :destroy ] do
      resources :purchases, only: [ :new, :create, :destroy ]
    end
  end
  
  root to: "splashes#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root to: "splash#index"
end

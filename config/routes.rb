# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "splashes#index"

    resources :users
    resources :groups, only: [ :new, :create, :show ] do
      resources :purchases, only: [ :new, :create ]
    end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root to: "splash#index"
end

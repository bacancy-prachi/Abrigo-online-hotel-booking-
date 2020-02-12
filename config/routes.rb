# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bookings
  resources :rooms
  resources :categories
  resources :roles
  resources :hotels
  resources :locations
  root to: 'users#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

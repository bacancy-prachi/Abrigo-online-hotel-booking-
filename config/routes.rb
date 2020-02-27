# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :filters
  resources :room_bookings
  resources :bookings
  resources :rooms
  resources :categories
  resources :hotels
  resources :locations
  root to: 'users#home'
  get 'users', to: 'users#show'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# frozen_string_literal: true

Rails.application.routes.draw do
  get 'avail_date', to: 'bookings#avail_date'
  namespace :charts do
    get 'new_user'
    get 'show_category'
    get 'show_hotel'
  end
  # devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :filters
  
  resources :room_bookings do
    # get 'user_index', on: :collection, action: :user_index
  end
  get '/room_bookings/user_index/:id' => 'room_bookings#user_index', as: :user_index
  get 'show_room',to: "bookings#show_room"
  resources :bookings
  # get 'bookings', to: 'bookings#confirm'
  resources :categories

  resources :hotels do
    resources :reviews, except: [:show, :index]
    resources :rooms, shallow: true do
    end
  end
  # get 'rooms/new_room/:hotel_id' => "rooms#create", as: :new_room
  resources :locations
  root to: 'users#home'
  get 'users', to: 'users#show'
  get 'charts', to: 'users#insight'
  devise_for :users
  resources :charges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

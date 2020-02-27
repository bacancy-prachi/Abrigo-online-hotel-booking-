# frozen_string_literal: true

json.extract! booking, :id, :check_in, :check_out, :no_of_rooms, :user_id, :room_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)

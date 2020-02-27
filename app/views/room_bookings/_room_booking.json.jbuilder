# frozen_string_literal: true

json.extract! room_booking, :id, :check_in, :check_out, :booking_id, :room_id, :created_at, :updated_at
json.url room_booking_url(room_booking, format: :json)

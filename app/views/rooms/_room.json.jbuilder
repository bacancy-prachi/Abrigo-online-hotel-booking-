# frozen_string_literal: true

json.extract! room, :id, :availibility, :hotel_id, :category_id, :created_at, :updated_at
json.url room_url(room, format: :json)

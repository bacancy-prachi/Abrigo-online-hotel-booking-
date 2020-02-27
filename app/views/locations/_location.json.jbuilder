# frozen_string_literal: true

json.extract! location, :id, :city, :pincode, :created_at, :updated_at
json.url location_url(location, format: :json)

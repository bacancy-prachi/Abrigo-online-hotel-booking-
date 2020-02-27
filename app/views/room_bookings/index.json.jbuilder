# frozen_string_literal: true

json.array! @room_bookings, partial: 'room_bookings/room_booking', as: :room_booking

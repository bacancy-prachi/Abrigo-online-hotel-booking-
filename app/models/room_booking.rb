# frozen_string_literal: true

class RoomBooking < ApplicationRecord
  belongs_to :booking
  belongs_to :room
end

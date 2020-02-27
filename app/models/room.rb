# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, through: :room_bookings
  belongs_to :category

  def display_room
  	self.id.to_s + self.category.name
  end

  # scope available_rooms: {
  	
  # }
end

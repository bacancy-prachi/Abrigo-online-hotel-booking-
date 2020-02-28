# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, through: :room_bookings
  belongs_to :category

  def display_room
  	self.room_number.to_s + "("+self.category.name+")"
  end
  # belongs_to :room
  # accepts_nested_attributes_for :room, reject_if: :all_blank, allow_destroy: true
  scope :available_rooms, -> {
   where(availibility: true)    	
   }
end

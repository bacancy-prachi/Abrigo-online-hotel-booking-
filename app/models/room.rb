class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, :through => :room_bookings 
  belongs_to :category
end

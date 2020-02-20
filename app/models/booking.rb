class Booking < ApplicationRecord
  belongs_to :user
  has_many :rooms, :through => :room_bookings
end

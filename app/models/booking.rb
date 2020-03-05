# frozen_string_literal: true

class Booking < ApplicationRecord
  has_many :room_bookings, dependent: :destroy
  belongs_to :user
  # has_many :rooms
  has_many :rooms, through: :room_bookings, dependent: :destroy

  accepts_nested_attributes_for :room_bookings, reject_if: :all_blank, allow_destroy: true
end

#    before_validation :rooms_are_available

#    validate :last_date_greater_than_start_date_and_smaller_six_month
#    validates :room_booking_id,:room_id, :check_in, :check_out, presence: true


#     def last_date_greater_than_start_date_and_smaller_six_month 
#     if dates_is_blank?
#       return true
#     elsif Date.today > check_in.to_date
#       errors.add(:check_in, "check in date should be greater or equal to today's date")
#     # last_date should be smaller than 6 months
#     elsif Date.today + 6.months < check_out.to_date 
#       errors.add(:check_out, "Check out date should be smaller than 6 months")
#     # last_date should be greater than start_date
#     elsif check_out.to_date < check_in.to_date
#       errors.add(:check_out, "check out date should be greater than Check in Date")
#     end
#   end

# 	# get the all the room_id which room are booked in between start_date and last_date
#   def self.excluded_id(check_in,check_out)
#     # if array is empty return  true else return the array
#     if (b= Booking.where("Date(check_in) < ? AND Date(check_out) > ? ", check_out,check_in).collect(&:room_id)).empty?
#       return false
#     else
#       return b
#     end
#   end

#   def rooms_are_available
#     if dates_is_blank?
#       return true
#     # last_date should be smaller than 6 months
#   	elsif (rooms = Room.avail_rooms(check_in,check_out,Category.name).limit(1)).length > 0
#   		self.room_id = rooms.first.id
# 		else

# 			errors.add(:num_of_user, "Rooms are not available #{room_type}")
# 		end
#   end

#   def dates_is_blank?
#     if check_in.blank? || check_out.blank?
#       return true
#     end
#   end

#   def room_type_int
#     self.class.Category.name[self.Category.name]
#   end
# end

  

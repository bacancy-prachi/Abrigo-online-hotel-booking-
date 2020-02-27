class RoomBooking < ApplicationRecord
  belongs_to :booking
  belongs_to :room

  #accepts_nested_attributes_for :categories, reject_if: :all_blank, allow_destroy: true 

end

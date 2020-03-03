# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, through: :room_bookings
  has_many :bookings
  belongs_to :category

  def display_room
    room_number.to_s + '(' + category.name + ')'
  end
  # belongs_to :room
  # accepts_nested_attributes_for :room, reject_if: :all_blank, allow_destroy: true
  scope :available_rooms, lambda {
                            where(availibility: true)
                          }
end

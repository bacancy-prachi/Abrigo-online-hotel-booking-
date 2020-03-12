# frozen_string_literal: true

class Booking < ApplicationRecord
  has_many :room_bookings, dependent: :destroy
  belongs_to :user
  has_many :rooms, through: :room_bookings, dependent: :destroy

  accepts_nested_attributes_for :room_bookings, reject_if: :all_blank, allow_destroy: true
end

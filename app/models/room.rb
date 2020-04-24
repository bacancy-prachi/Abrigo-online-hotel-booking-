# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :hotel
  has_many :room_bookings, dependent: :destroy
  has_many :bookings, through: :room_bookings
  belongs_to :category
  # attr_accessor :category_name

  # def category_name
  #   category.name
  # end

  def display_room
    room_number.to_s + '(' + category.name + ')' + '(' + 'price' + category.price.to_s + ')'
  end
  # belongs_to :room
  # accepts_nested_attributes_for :room, reject_if: :all_blank, allow_destroy: true
  scope :available_rooms, -> { where(availibility: true) }
end

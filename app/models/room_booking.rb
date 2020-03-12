# frozen_string_literal: true

class RoomBooking < ApplicationRecord
  belongs_to :booking
  belongs_to :room
  validates :check_in, presence: true
  validates :check_out, presence: true
  before_create :avail

  def avail; end
end

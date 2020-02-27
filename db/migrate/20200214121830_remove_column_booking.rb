# frozen_string_literal: true

class RemoveColumnBooking < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :check_out
    remove_column :bookings, :room_id
  end
end

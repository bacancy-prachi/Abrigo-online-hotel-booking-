class AddHotelIdToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :hotel_id, :integer
  end
end

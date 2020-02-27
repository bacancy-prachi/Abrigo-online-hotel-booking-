class AddColumnsToRoom < ActiveRecord::Migration[6.0]
  def change
  	add_column :rooms, :room_number, :integer
  	add_column :rooms, :availibility, :boolean
  end
end

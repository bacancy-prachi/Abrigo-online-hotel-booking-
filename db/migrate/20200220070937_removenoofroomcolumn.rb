class Removenoofroomcolumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :no_of_rooms
  end
end

class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :address
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end

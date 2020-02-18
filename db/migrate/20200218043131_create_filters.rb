class CreateFilters < ActiveRecord::Migration[6.0]
  def change
    create_table :filters do |t|
      t.string :city
      t.string :category
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end
  end
end

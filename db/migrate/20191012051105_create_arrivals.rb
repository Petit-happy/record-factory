class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.integer :product_id
      t.integer :arrival_sum
      t.datetime :arrived_at

      t.timestamps
    end
  end
end

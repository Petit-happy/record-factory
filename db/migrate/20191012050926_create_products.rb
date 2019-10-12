class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.integer :label_id
      t.integer :artist_id
      t.integer :photo_id
      t.integer :product_price
      t.integer :sales_status
      t.string :product_name
      t.boolean :is_deleted

      t.timestamps
    end
  end
end

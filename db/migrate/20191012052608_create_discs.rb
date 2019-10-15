class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :product_id
      t.integer :desc_no

      t.timestamps
    end
  end
end
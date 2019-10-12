class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :end_user_id
      t.integer :product_id
      t.integer :cart_sum
      t.integer :cart_sum

      t.timestamps
    end
  end
end

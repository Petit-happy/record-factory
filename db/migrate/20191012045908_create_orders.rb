class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :delivery_cost
      t.integer :total_price
      t.integer :order_status
      t.string :order_post_code
      t.text :order_address

      t.timestamps
    end
  end
end

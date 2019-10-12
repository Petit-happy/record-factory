class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id
      t.text :delivery_address
      t.text :delivery_name
      t.string :delivery_post_code

      t.timestamps
    end
  end
end

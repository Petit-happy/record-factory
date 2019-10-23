class AddMethodOfPaymetToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :method_of_payment, :integer
  end
end

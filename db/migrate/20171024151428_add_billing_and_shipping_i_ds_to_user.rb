class AddBillingAndShippingIDsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :billing_id, :bigint
    add_foreign_key :users, :addresses, column: :billing_id

    add_column :users, :shipping_id, :bigint
    add_foreign_key :users, :addresses, column: :shipping_id
  end
end

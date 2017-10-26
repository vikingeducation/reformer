class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :credit_card, foreign_key: true
      t.bigint :billing_id
      t.bigint :shipping_id
      t.datetime :checkout_date


      t.timestamps
    end

    add_foreign_key :orders, :addresses, column: :shipping_id
    add_foreign_key :orders, :addresses, column: :billing_id
  end
end

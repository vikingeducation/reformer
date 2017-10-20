class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_1, null: false
      t.string :street_2
      t.references :city
      t.references :state
      t.references :user
      t.string :post_code, null: false
      t.string :plus_4

      t.timestamps
    end
  end
end

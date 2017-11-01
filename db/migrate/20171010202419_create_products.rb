class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

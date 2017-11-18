class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text "username", null: false
      t.text "email", null: false
      t.text "password", null: false
      t.timestamps
    end
  end
end

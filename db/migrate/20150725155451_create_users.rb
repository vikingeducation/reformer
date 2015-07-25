class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :username, :unique => true, null: false
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps null: false
    end
  end
end
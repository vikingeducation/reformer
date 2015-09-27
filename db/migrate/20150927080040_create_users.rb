class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password

      t.index :username, :unique => true
      t.index :email, :unique => true

      t.timestamps null: false
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :email, :null => false, :unique => true, :index => true
      t.string :password, :null => false

      t.timestamps
    end
  end
end

class AddValidationsToUsers < ActiveRecord::Migration[5.1]
  def up
      change_column :users, :username, :string, null: false, unique: true
      change_column :users, :email, :string, null: false, unique: true
      change_column :users, :password, :string, null: false
  end

  def down
      change_column :users, :username, :string, null: true, unique: false
      change_column :users, :email, :string, null: true, unique: false
      change_column :users, :password, :string, null: true
  end
end

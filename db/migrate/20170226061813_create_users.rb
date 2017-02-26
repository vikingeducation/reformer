class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, index: true
      t.string :email, index: true
      t.string :password

      t.timestamps
    end
  end
end

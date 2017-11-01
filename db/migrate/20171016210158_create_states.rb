class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbrev, null: false

      t.timestamps
    end

    add_index :states, :name, unique: true
    add_index :states, :abbrev, unique: true
  end
end

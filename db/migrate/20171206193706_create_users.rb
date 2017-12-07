# Generates table without db validations
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end

# Generates table with db validations
# But do not run this for this app because there is a
# subsequent migration to add the db validations

# class CreateUsers < ActiveRecord::Migration[5.1]
#   def change
#     create_table :users do |t|
#       t.string :username, null: false, unique: true
#       t.string :email, null: false, unique: true
#       t.string :password, null: false

#       t.timestamps
#     end
#   end
# end




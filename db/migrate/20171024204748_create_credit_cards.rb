class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.references :user, foreign_key: true
      t.string :number, null: false
      t.date :expires, null: false
      t.bigint :cv2

      t.timestamps
    end
  end
end

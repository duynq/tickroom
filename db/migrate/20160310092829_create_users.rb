class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.date :birthday
      t.string :gender
      t.string :phoneNumber
      t.string :address
      t.integer :role

      t.timestamps null: false
    end
  end
end

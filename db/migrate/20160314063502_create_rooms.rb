class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.float :price
      t.string :lat
      t.string :lng
      t.integer :room_type
      t.integer :number_person
      t.integer :home_type
      t.integer :province
      t.string :rule
      t.string :description
      t.string :address
      t.boolean :internet
      t.boolean :tv
      t.boolean :wifi
      t.boolean :kid
      t.boolean :aircondition
      t.boolean :elevator
      t.boolean :kitchen
      t.boolean :heating
      t.boolean :computer

      t.timestamps null: false
    end
  end
end

class AddDescToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :desc, :string
  end
end

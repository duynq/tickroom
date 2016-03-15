class RemoveLocationFromRooms < ActiveRecord::Migration
  def change
    remove_column :rooms, :location, :string
  end
end

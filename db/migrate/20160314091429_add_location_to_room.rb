class AddLocationToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :location, :string
  end
end

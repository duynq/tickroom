class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  scope :room_exist, ->user_id, room_id{ where "user_id = ? AND room_id = ?", user_id, room_id }
end

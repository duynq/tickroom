class Photo < ActiveRecord::Base
  belongs_to :room
  mount_uploader :image, ImageUploader

  ATTRIBTES_PARAMS = [:image]
end

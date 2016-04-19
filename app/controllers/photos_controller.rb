class PhotosController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    @photo = Photo.new photo_params
    if @photo.save!
      flash[:success] = "Thêm ảnh thành công!"
      redirect_to @photo
    else
      flash[:warn] = "Thêm ảnh không thành công!"
      rend :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit Photo::ATTRIBTES_PARAMS
  end
end

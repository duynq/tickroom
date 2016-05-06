class FavoritesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.new favorite_params
    respond_to do |format|
      if @favorite.save!
        format.js
      else
        flash[:info] = "Lưu khônh thành công"
      end
    end
  end

  private
  def favorite_params
    params.require(:favorite).permit :room_id
  end
end

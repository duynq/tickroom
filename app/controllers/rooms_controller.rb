class RoomsController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:search]
      @rooms = Room.search(params[:search]).order("created_at DESC")
    else
      @rooms = Room.all.order('created_at DESC')
    end
  end

  def show
    @comments = Comment.where("room_id = ?", @room.id)
    respond_to do |format|
      format.html
      format.json {render json: @room.as_json(only: [:lat, :lng])}
    end
  end

  def new
    6.times{@room.photos.build}
  end

  def edit

  end

  def update

  end

  def create
    @room = current_user.rooms.new room_params
    if @room.save!
      flash[:info] = "Tạo phòng thành công!"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, :lat, :lng, :address, :price, :number_person,
      :user_id, :home_type, :room_type, :province, :rule, :description, :internet, :tv, :wifi, :kid, :aircondition,
      :elevator, :kitchen, :heating, :computer, photos_attributes: [:id, :image, :_destroy])
  end
end

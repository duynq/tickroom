class RoomsController < ApplicationController


  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params
    if @room.save!
      flash[:info] = "Sign up success!"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit :name, :desc, :address
  end
end

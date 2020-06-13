class RoomsController < ApplicationController
  before_action :require_user_logged_in, only:[:index, :show, :new]
  
  def index
    @rooms = Room.order(id: :desc).page(params[:page]).per(10)
  end
  
  def show
    @room = Room.find(params[:id])
    @comment = current_user.comments.build
    @comments = @room.comments.page(params[:page]).per(50)
  end

  def new
    @room = current_user.rooms.build
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room
    else
      render :new
    end
  end
  
  private
   
  def room_params
    params.require(:room).permit(:title).merge(user_id: current_user.id)
  end
end

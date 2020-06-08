class RoomsController < ApplicationController
  before_action :require_user_logged_in, only:[:index, :show, :new]
  
  def index
    @rooms = Room.order(id: :desc)
  end
  
  def show
    @room = Room.find(params[:id])
    @comment = current_user.comments.build
    @comments = @room.comments
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      render :new
    end
  end
  
  private
   
  def room_params
    params.require(:room).permit(:title)
  end
end

class CommentsController < ApplicationController
  
  def create
    room = Room.find(params[:room_id])
    # binding.pry
    @comment = current_user.comments.build(comment_params)
    @comment.assign_attributes(room_param)
    if @comment.save
      redirect_to room_url(room)
    else
      render room_path(room)
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def room_param
    params.permit(:room_id)
  end

end

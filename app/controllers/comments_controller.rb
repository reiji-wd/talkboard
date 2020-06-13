class CommentsController < ApplicationController
  
  def create
    room = Room.find(params[:room_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to room_url(room)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :image).merge(room_id: params[:room_id])
  end

end

class CommentsController < ApplicationController
  
  def create
    room = Room.find(params[:room_id])
    @comment = current_user.comments.build(comment_params)
    if @comment.save 
      flash[:success] = 'コメントを投稿しました。'
      redirect_to room_url(room)
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      @room = Room.find(room.id)
      @comments = @room.comments.page(params[:page]).per(50)
      render "rooms/show"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'コメントを削除しました。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :image).merge(room_id: params[:room_id])
  end

end

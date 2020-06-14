class UsersController < ApplicationController
  before_action :require_user_logged_in, only:[:show, :edit]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザ登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to @user
    end
  end
  
  def update
    if @user = User.update(update_user_params)
      flash[:success] = 'ユーザ情報を更新しました。'
      redirect_to user_url(params[:id])
    else
      render edit_user_path(params[:id])
    end
  end
  
  def destroy
    @user = User.find_by(id: current_user.id)
    @user.destroy
    redirect_to signup_path
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def update_user_params
    params.require(:user).permit(:name, :profile, :image, :email, :password, :password_confirmation)
  end
    
end

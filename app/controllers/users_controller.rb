class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def mypage
    @user = current_user
    @posts = @user.posts
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all
  end

   def update
     @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to mypage_path
    end
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to mypage_path
    else
      render :edit
    end
   end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to root_url if current_user != @user
  end
end

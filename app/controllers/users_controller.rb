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
    @user.update(user_params)
    redirect_to user_path(@user.id)
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

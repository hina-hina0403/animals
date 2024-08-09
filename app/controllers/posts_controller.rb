class PostsController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end
end

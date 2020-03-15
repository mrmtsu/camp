class PostsController < ApplicationController

  def index
  end

  def new
    #↓一文追加
    @topic = Post.new
    @post = Post.new
    @posts = Post.includes(:user)
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :text).merge(user_id: current_user.id)
  end


end

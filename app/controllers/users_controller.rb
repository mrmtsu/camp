class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(20).order("created_at DESC")
    @name = @user.name
    # @favorite_posts = @user.favorite_posts
    # @bookmark_posts = @user.bookmark_ids
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  

  def like(post)
    favorites.find_or_create_by(post_id: post.id)
  end

  def unlike(post)
    favorite = favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end

  def follows
    # @parents = Category.all.order("id ASC").limit(2)
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    # @parents = Category.all.order("id ASC").limit(2)
    user = User.find(params[:id])
    @users = user.followers
  end

  def bookmarks
    user = User.find(params[:id])
    @users = user.bookmarks.ids
    @bookmark = @users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

end

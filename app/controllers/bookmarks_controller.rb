class BookmarksController < ApplicationController

  def index
    posts = Post.all
    @posts = Post.includes(:user)
    @user = current_user
    @bookmarks = Bookmark.where(user_id: @user.id).all
  end

  def create
    @bookmark = current_user.bookmarks.build(post_id: params[:post_id])
    @bookmark.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @bookmark = Bookmark.find_by(post_id: params[:post_id], user_id: current_user.id)
    @bookmark.destroy
    redirect_to post_path(params[:post_id])
  end

  def show_bookmarks
    @post = Post.find(params[:id])
    @bookmarks = Bookmark.where(post_id: @post.id).all
  end
end
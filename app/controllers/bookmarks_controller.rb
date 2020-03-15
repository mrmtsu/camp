class BookmarksController < ApplicationController

  def index
    posts = Post.all
    @posts = Post.includes(:user)
    #@post = Post.new
    @user = current_user
    @bookmarks = Bookmark.where(user_id: @user.id).all
    #@bookmarks = @user.posts
  end

  def create
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
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
class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id])}
      format.json
    end
  end

  def destroy
    comment = Comment.find(comment_params)
    comment.destroy
  end

  #def create
    #@comment = Comment.new(comment_params)
    #@post = @comment.post
    #if @comment.save
      # ここから
      #@post.create_notification_comment!(current_user, @comment.id)
      # ここまで
      #respond_to :js
    #else
      #render 'posts/show'
    #end
  #end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
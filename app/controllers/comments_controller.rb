class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new comment_params
    respond_to do |format|
      if @comment.save!
        format.html {redirect_to @room}
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    respond_to do |format|
      if @comment.destroy!
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :room_id, :user_id
  end
end

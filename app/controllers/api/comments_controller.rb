class Api::CommentsController < ApplicationController
  respond_to :json

  def destroy
    @comment = Comment.find_by id: params[:id]
    render text: @comment.destroy ?
      "success" : "fail"
  end
end

class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    recipient = User.where(id: conversation_params[:recipient])
    conversation = current_user.send_message(recipient, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Tin nhắn của bạn được gửi thành công"
    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Tin nhắn trả lời của bạn đã gửi thành công"
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
  end

  private
  def conversation_params
    params.require(:conversation).permit(:subject, :body, :recipient)
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end
end

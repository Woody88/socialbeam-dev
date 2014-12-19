class MessagesController < ApplicationController
  def index
    if params[:mailbox] == "sent"
      @messages = @user.sent_messages
    elsif params[:mailbox] == "inbox"
      @messages = @user.received_messages
    #elsif params[:mailbox] == "archieved"
    # @messages = @user.archived_messages
    end  
  end

  def new
    @message = Message.new
    if params[:reply_to]
      @reply_to = User.find_by_beamer_id(params[:reply_to])
    unless @reply_to.nil?
      @message.recepient_id = @reply_to.find_by_beamer_id
    end
    end  
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = @user.beamer.id
    if @message.save
      flash[:notice] = "Message has been sent"
      redirect_to user_messages_patch(current_user, :mailbox => :inbox)
    else
      render :action => :new
    end
  end

  def show
    @message = Message.readingmessage(params[:id], @user.beamer_id)
  end

  def delete_multiple
    if params[:delete]
      params[:delete].each { |id|
        @message = Message.find(id)
        @message.mark_message_delete(message.id, @user.beamer_id) unless @message.nil?
      }
      flash[:notice] = "Message deleted"
    end
    redirect_to user_messages_patch(@user, @messages)
  end

  private

  def set_user
    @user = current_user
  end

  def message_params
    params.require(:message).permit(:subject, :body, :sender_id, :recepient_id, :read_at,:sender_deleted,:recepient_deleted)
  end
end

class MessagesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @messages = Message.where("sender_id = ? or receiver_id = ?", @user.id, @user.id).paginate(page: params[:page], :per_page => 6)
  end

  def create
    # binding.pry
    sender = User.find(params[:message][:sender_id])
    receiver = User.find(params[:message][:receiver_id])
    @message = Message.new(message_params)
    # binding.pry
    if (@message.save)
      flash[:success] = "A message has been sent to " + receiver.name
      redirect_to :back
    else
      flash[:warning] = "Invalid input, please try again!"
      @all_error_messages = @message.errors
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:user_id])
    @message = Message.find(params[:id])
    if current_user?(@user) && @user == User.find(@message.receiver_id)
      @message.update_attribute(:status , true) if @message.status == false
    else
      redirect_to :back
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to user_messages_path(current_user)
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :sender_id, :receiver_id)
  end

  def correct_user
    redirect_to :back if current_user?(User.find(params[:user_id]))
  end
end

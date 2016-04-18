# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  sender_id    :integer
#  recipient_id :integer
#  content      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class MessagesController < ApplicationController

  def new
    @message= Message.new
  end

  def create
    sender_id = params[:user_id]
    rec_id= User.find_by(email: params[:message][:recipient_id]).id
    @message = Message.create(sender_id: sender_id, recipient_id: rec_id, content: params[:message][:content])
    redirect_to "/users/"+sender_id+"/messages"
  end

  def show
    @message= Message.find(params[:message_id])
  end

  def index
    @messages= Message.messages_of(params[:user_id])
  end

  def destroy
  end
end

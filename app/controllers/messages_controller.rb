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
    @message = Message.create(sender_id: params[:sender_id], recipient_id: params[:recipient_id], content: params[:content])
    render nothing: true
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

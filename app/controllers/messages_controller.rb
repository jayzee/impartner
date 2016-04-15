class MessagesController < ApplicationController

  def new
    @message= Message.new
    binding.pry
  end

  def create
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

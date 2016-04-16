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

class Message < ActiveRecord::Base


  def self.parse_recipient(string)
    recipient= User.find_by(email: string)
    Message.create(sender_id: @current_user.id, recipient_id: recipient.id)
  end

  def reply
    new_recip= self.sender_id
    new_sender= self.recipient_id
    Message.create(sender_id: new_sender, recipient_id: new_recip)
  end

  def self.messages_of(user_id)
    where_user_is_recipient= Message.where(sender_id: user_id) 
    where_user_is_sender= Message.where(recipient_id: user_id)   
    where_user_is_recipient.each do |msg|
      where_user_is_sender << msg
    end
    total_messages = where_user_is_sender
    total_messages.sort_by{|msg| msg.id}
  end

  def conversations_with(user)
    where_user_is_recipient= Message.messages_of(@current_user).where(sender_id: user) 
    where_user_is_sender= Message.messages_of.where(recipient_id: user)
    total_messages= where_user_is_recipient.merge(where_user_is_sender)
    total_messages.sort_by{|msg| msg.id}
  end

end

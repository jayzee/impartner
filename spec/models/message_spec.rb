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

require 'rails_helper'

RSpec.describe Message, type: :model do


  let(:curent_user){Student.new(name: "Bobbo",user_id: 1)}
  let(:teacher){Teacher.new(name: "Freddy", user_id: 2)}
  let(:message_to_teacher){Message.new(sender_id: 1, recipient_id: 2, content: "HEYO IT BOBBO")}
  let(:reply_to_student){Message.new(sender_id: 2, recipient_id: 1, content: "Never say that again.")}

  describe "#parse_recipient" do

    it "finds a user id by email" do
      recip_id = Message.parse_recipient("Bobbo")
      expect(recip_id).to eq(curent_user.user_id)
    end
  end

  describe "#reply" do
    it "creates a new message where the sender_id is the old message's recipient_id" do
      reply_message= message_to_teacher.reply
      expect(reply_message.sender_id).to eq(message_to_teacher.recipient_id)
    end

    it "creates a new message where the recipient_id is the old message's sender_id" do
      reply_message= message_to_teacher.reply
      expect(reply_message.recipient_id).to eq(message_to_teacher.sender_id)
    end
  end

  describe"#conversations_with" do
    it "gathers all messages with a given user into an array" do 
      messages= conversations_with(teacher)
      expect(messages.length).to eq(2)
    end
  end

end

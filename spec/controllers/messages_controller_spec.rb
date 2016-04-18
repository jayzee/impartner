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

RSpec.describe MessagesController, type: :controller do

end

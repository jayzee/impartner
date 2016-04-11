# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  title      :string
#  track_id   :integer
#  duration   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#

require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end

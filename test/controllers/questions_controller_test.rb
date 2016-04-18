# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  content        :string
#  answer         :string
#  points_value   :integer
#  assessment_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  correct_answer :string
#

require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end

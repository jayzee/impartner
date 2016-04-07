# == Schema Information
#
# Table name: assessments
#
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  challenge? :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean
#

require 'test_helper'

class AssessmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

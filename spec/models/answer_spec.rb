# == Schema Information
#
# Table name: answers
#
#  id                :integer          not null, primary key
#  student_id        :integer
#  assessment_id     :integer
#  total_point_value :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  question_id       :integer
#  content           :string
#

require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

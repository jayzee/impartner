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

class Answer < ActiveRecord::Base
  belongs_to :student
  belongs_to :question
  belongs_to :assessment
end

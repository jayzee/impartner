# == Schema Information
#
# Table name: students_assessments
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  assessment_id :integer
#  completed     :boolean          default(FALSE)
#

class StudentsAssessment < ActiveRecord::Base
  belongs_to :student 
  belongs_to :assessment

  def mark_as_completed
    self.update(completed: true)
  end
end

# == Schema Information
#
# Table name: students_assessments
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  assessment_id :integer
#  completed     :boolean          default(FALSE)
#  points        :integer
#

class StudentsAssessment < ActiveRecord::Base
  belongs_to :student 
  belongs_to :assessment

  def mark_as_complete
    self.update(completed: true)
    student= self.student
    lesson = self.assessment.lesson
    s_l= StudentsLesson.find_by(student_id: student.id, lesson_id: lesson.id)
    s_l.check_completion
  end

end

# == Schema Information
#
# Table name: students_resources
#
#  id          :integer          not null, primary key
#  student_id  :integer
#  resource_id :integer
#  completed   :boolean          default(FALSE)
#

class StudentsResource < ActiveRecord::Base
  belongs_to :student 
  belongs_to :resource

  def mark_as_complete
    self.update(completed: true)
    student= self.student
    lesson = self.resource.lesson
    s_l= StudentsLesson.find_by(student_id: student.id, lesson_id: lesson.id)
    s_l.check_completion
  end
end

# == Schema Information
#
# Table name: students_lessons
#
#  id         :integer          not null, primary key
#  student_id :integer
#  lesson_id  :integer
#  completed  :boolean          default(FALSE)
#

class StudentsLesson < ActiveRecord::Base
  belongs_to :student 
  belongs_to :lesson

  def check_completion
    resource?= self.check_resource_completion
    assessment? = self.check_assessment_completion

    if resource? && assessment?
      self.mark_as_complete
    end
  end

  def mark_as_complete
    self.update(completed: true)
    t_id = self.lesson.track.id
    s_id= self.student.id
    s_t= StudentsTrack.find_by(student_id: s_id, track_id: t_id)
    s_t.check_completion
  end

  def check_resource_completion
    resources = self.lesson.resources
    resources.map! do |r|
      StudentsResource.find_by(student_id: self.student.id, resource_id: r.id)
    end
    resources.all? {|r| r.completed}
  end

  def check_assessment_completion
    assessments = self.lesson.assessments
    assessments.map! do |a|
      StudentsAssessment.find_by(student_id: self.student.id, resource_id: a.id)
    end
    assessment.all? {|a| a.completed}
  end
end

# == Schema Information
#
# Table name: students_tracks
#
#  id         :integer          not null, primary key
#  student_id :integer
#  track_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean          default(FALSE)
#

class StudentsTrack < ActiveRecord::Base
  belongs_to :student 
  belongs_to :track

  def check_completion
    lessons = self.track.lessons
    student = self.student.id
    lessons.map!{|l| StudentsLesson.find_by(student_id: student, lesson_id: l.id)}
    if lessons.all?{|l| l.completed}
      self.mark_as_completed
    end
  end

  def mark_as_completed
    self.update(completed: true)
  end

  def percent_complete(track)
    total_contents= self.track.lessons.map {|l| l.resources.merge(l.assessments)}
    completed_contents= total_contents.find_by(completed: true)
    completed_contents.count
  end

end

# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  privacy     :boolean
#  teacher_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  name        :string
#  description :string
#

class Track < ActiveRecord::Base
  has_many :lessons
  belongs_to :teacher
  belongs_to :category
  has_many :students_tracks
  has_many :students, through: :students_tracks

  def completion
    if self.lessons.all? {|lesson| lesson.completed}
      self.update(completed: true)
    end
  end

  def is_user_a_student_of_track(current_user_id)
    student = StudentsTrack.find_by(student_id: current_user_id, track_id: self.id)

    if student != nil
      return true
    else
      return false
    end

  end

end

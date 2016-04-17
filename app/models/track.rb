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

  validates :image_url, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }



  def completion
    if self.lessons.all? {|lesson| lesson.completed}
      self.update(completed: true)
    end
  end

  def is_user_a_student_of_track(user)
    if user.student != nil
      student = StudentsTrack.find_by(student_id: user.student.id, track_id: self.id)
    else
      student = nil
    end

    if student != nil
      return true
    else
      return false
    end

  end

  def is_user_a_teacher_of_track(user)
    self.teacher.user_id == user.id
  end


  #method to return an array of all the students in a track
  def students_in_the_track
    self.students
  end


  # method to return an array of all the students in a class ranked by points
  def students_in_the_track_ranked(track)
    self.students.sort_by { |student| student.user.points}
  end


end

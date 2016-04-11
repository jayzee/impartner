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
  
end

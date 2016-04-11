# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  content     :string
#  type_of     :string
#  lesson_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  order_id    :integer
#  description :string
#  title       :string
#

class Resource < ActiveRecord::Base
  belongs_to :lesson
  has_many :students_resources
  has_many :students, through: :students_resources

  def mark_as_complete
    self.update(completed: true)
    self.lesson.track_completion
  end 

end

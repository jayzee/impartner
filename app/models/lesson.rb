# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  title      :string
#  track_id   :integer
#  duration   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  completed  :boolean
#

class Lesson < ActiveRecord::Base
  has_many :resources
  has_many :assessments
  belongs_to :track

  def track_completion
    check_resources = self.resources.all? {|resource| resource.completed}
    check_assessments = self.assessments.all? {|assessment| assessment.completed}

    if check_resources && check_assessments
      self.mark_as_completed
    end 

  end 

  def mark_as_completed
    self.update(completed: true)
    self.track.completion
  end

end

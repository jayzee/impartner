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
end
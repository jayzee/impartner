# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Student < ActiveRecord::Base
  belongs_to :user
  has_many :students_tracks
  has_many :tracks, through: :students_tracks
  has_many :students_lessons
  has_many :lessons, through: :students_lessons
  has_many :students_resources
  has_many :resources, through: :students_resources
  has_many :students_assessments
  has_many :assessments, through: :students_assessments
end

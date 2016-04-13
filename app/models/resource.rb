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

  def video_id
    regex = /youtube.com.*(?:\/|v=)([^&$]+)/
    self.content.match(regex)[1]
  end 

end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  points     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_one :student
  has_one :teacher

  validates :name, presence: true

  validates :points, presence: true
end

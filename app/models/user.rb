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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :student
  has_one :teacher

  validates :name, presence: true

  validates :points, presence: true

#adds points to user
  def add_points(new_points)
    this.points += new_points
  end

end

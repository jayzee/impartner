# == Schema Information
#
# Table name: assessments
#
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  challenge? :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#

class Assessment < ActiveRecord::Base
  belongs_to :lesson
  has_many :students_assessments
  has_many :students, through: :students_assessments
  has_many :questions
  has_many :answers, through: :questions


  def self.all_questions(lesson)
    all = self.all.where(:lesson_id => lesson.id)
    all_questions = all.map {|x| x.questions}
    all_questions
  end 
end

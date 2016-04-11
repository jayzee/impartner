# == Schema Information
#
# Table name: students_lessons
#
#  id         :integer          not null, primary key
#  student_id :integer
#  lesson_id  :integer
#  completed  :boolean          default(FALSE)
#

class StudentsLesson < ActiveRecord::Base
  belongs_to :student 
  belongs_to :lesson
end

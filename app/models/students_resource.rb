# == Schema Information
#
# Table name: students_resources
#
#  id          :integer          not null, primary key
#  student_id  :integer
#  resource_id :integer
#  completed   :boolean          default(FALSE)
#

class StudentsResource < ActiveRecord::Base
  belongs_to :student 
  belongs_to :resource

  def mark_as_completed
    self.update(completed: true)
  end 
end

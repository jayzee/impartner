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

  def check_completetion_of_resource(item)
    item.completed ? true : false
  end
  
  def complete_resource(id)
    join = StudentsResource.find_by(student_id: self.id, resource_id: id)
    join.update(completed: true)
    check_sibling_completion(join)
  end

  def check_sibling_completion(resource)
    siblings = resource.lesson.resources
    siblings.map! do |sibling| 
      StudentsResource.find_by(student_id: self.id, resource_id: sibling.id)
    end
    siblings.all? {|s| s.check_completetion_of_resource}

  end

  def percent_complete(track)
    total_contents= track.lessons.resources
    completed_contents= total_contents.find_by(completed: true)
    (completed_contents.count / total_contents.count) * 100
  end

end

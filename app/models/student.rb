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

  def check_resource_completion(item)
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

    total_lessons_array = track.lessons

    completed_array = self.students_lessons.map do |studentLes|
        (studentLes.completed) == true && (track.id == studentLes.track_id)
    end

    #completed_contents = total_lessons_array.find_by(completed: true)
    if(completed_array.count != nil && total_lessons_array.count != nil && total_lessons_array.count != 0)
        return (completed_array.count / total_lessons_array.count) * 100
    else
        return 0
    end
  end


end

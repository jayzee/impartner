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
  has_many :answers

  def check_resource_completion(item)
    item.completed ? true : false
  end

  def complete_resource(id)
    join = StudentsResource.find_by(student_id: self.id, resource_id: id)
    join.update(completed: true)
    if check_sibling_completion(join)
      complete_lesson(join.resource.lesson.id)
    end
  end

  def complete_lesson(id)
    join = StudentsLesson.find_by(student_id: self.id, lesson_id: id)
    join.update(completed: true)
  end

  def check_sibling_completion(join)
    siblings = join.resource.lesson.resources
    sib_joins= siblings.map do |sibling|
      StudentsResource.find_by(student_id: self.id, resource_id: sibling.id)
    end
    sib_joins.all? {|s| check_resource_completion(s)}
  end

  def percent_complete(track)
  
    total_lessons_array = track.lessons

    completed_array = self.students_lessons.find_all do |studentLes|
        (studentLes.completed) == true && (track.id == studentLes.track_id)
    end
    #completed_contents = total_lessons_array.find_by(completed: true)

    if(completed_array.count != nil && total_lessons_array.count != nil && total_lessons_array.count != 0)
        return (completed_array.count / total_lessons_array.count) * 100
    else
        return 0
    end
  end

  def find_answer(question)
    self.answers.select { |answer| answer.question == question}
  end


end

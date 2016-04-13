# == Schema Information
#
# Table name: students_tracks
#
#  id         :integer          not null, primary key
#  student_id :integer
#  track_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean          default(FALSE)
#

class StudentsTracksController < ApplicationController
  def create
    if Student.find_by(user_id: current_user.id) == nil
        @student = Student.create(user_id: current_user.id)
    else
      @student = Student.find_by(user_id: current_user.id)
    end
  
    @studentTrack = StudentsTrack.create(track_id: params[:track_id],student_id: @student.id)
    @track = Track.find(params[:track_id])
    @track.lessons.each do |lesson|
      binding.pry
      StudentsLesson.create(lesson_id: lesson.id, student_id: @student.id)
      lesson.resources.each do |r|
        StudentsResource.create(resource_id: r.id, student_id: @student.id)
      end
    end
    binding.pry
    redirect_to track_path(@track)
  end

end

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
        Student.create(user_id: current_user.id)
    end
    binding.pry

    @studentTrack = StudentsTrack.create(track_id: params[:track_id],student_id: current_user.id)
    @track = Track.find(params[:track_id])


    redirect_to track_path(@track)
  end

end

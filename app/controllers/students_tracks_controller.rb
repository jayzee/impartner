class StudentsTracksController < ApplicationController
  def create

    @studentTrack = StudentsTrack.create(track_id: params[:track_id],student_id: current_user.id)
    @track = Track.find(params[:track_id])
    redirect_to track_path(@track)
  end

end

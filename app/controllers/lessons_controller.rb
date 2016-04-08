# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  title      :string
#  track_id   :integer
#  duration   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  completed  :boolean
#

class LessonsController < ApplicationController

  def show
    @lesson = Lesson.find(params[:id])
    resources = @lesson.resources
    assessments = @lesson.assessments
    @combinedResourceAssessments = resources + assessments
    @combinedResourceAssessments.sort_by{ |obj| obj.order_id }
  end

  def new
    @track= Track.find(params[:track_id])
    @lesson = @track.lessons.build()
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @track = @lesson.track
    @lesson.order_id = @track.lessons.length
    @lesson.save
    redirect_to lesson_path(@lesson)
  end

  private
  def lesson_params
    params.require(:lesson).permit!
  end
end

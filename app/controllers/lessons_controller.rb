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
end

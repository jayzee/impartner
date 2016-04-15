# == Schema Information
#
# Table name: assessments
#
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  challenge? :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#

class AssessmentsController < ApplicationController
  before_action :authorized_to_interact, only: [:edit]

  def show
    @assessment = Assessment.find(params[:id])
    @questions = @assessment.questions
  end 

  def create
    lesson = Lesson.find(params[:lesson_id])
    assessment = lesson.assessments.build()
    assessment.save
    redirect_to new_assessment_question_path(assessment)
  end 

  private

  def assessment_params
    params.require(:assessment).permit!
  end 
  
end

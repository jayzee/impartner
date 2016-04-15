# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  content       :string
#  answer        :string
#  points_value  :integer
#  assessment_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class QuestionsController < ApplicationController

  def new
    @assessment = find_assessment
    @question = @assessment.questions.build()
  end 

  def create 
    @assessment = find_assessment
    @question = @assessment.questions.build(question_params)
    @question.save
    
    respond_to do |format| 
      format.json {render json: @question}
    end 
  end 

  private

  def find_assessment
    Assessment.find(params[:assessment_id])
  end 

  def question_params
    params.require(:question).permit!
  end 
end

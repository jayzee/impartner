# == Schema Information
#
# Table name: answers
#
#  id                :integer          not null, primary key
#  student_id        :integer
#  assessment_id     :integer
#  total_point_value :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  question_id       :integer
#  content           :string
#

class AnswersController < ApplicationController

  def create
    @answer = Answer.create(answer_params)

    respond_to do |format| 
      format.json {render json: @answer}
    end 
  end 

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @string = render_to_string(:layout => edit_question_answer_path, :layout => false, locals: {:question => @question, :answer => @answer})

    respond_to do |format| 
      format.js 
    end 
  end 


  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    
    respond_to do |format| 
      format.js 
    end 
  end 

  private 

  def answer_params
    params.require(:answer).permit(:content, :student_id, :assessment_id, :question_id, :total_point_value)
  end 
end 

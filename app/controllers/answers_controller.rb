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
    @question = Question.find(params[:question_id])
    @answer = Answer.create(answer_params)
    unless @question.correct_answer.nil?
      check_exact_match = @question.correct_answer.downcase == @answer.content.downcase
      check_almost_match = @answer.content.include?(@question.correct_answer.downcase)

      if check_exact_match || check_almost_match
        @answer.correct = true
        @answer.total_point_value == 2
        current_user.add_points(2)
      else
        @answer.correct = false
        @answer.total_point_value == 0
      end
    end
    @answer.save 

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

    unless @question.correct_answer.nil?
      check_exact_match = @question.correct_answer.downcase == @answer.content.downcase
      check_almost_match = @answer.content.include?(@question.correct_answer.downcase)

      if check_exact_match || check_almost_match
        @answer.correct = true
        @answer.total_point_value == 2
        current_user.add_points(2)
      else
        @answer.correct = false
        @answer.total_point_value == 0
      end
    end
    @answer.save 
    
    respond_to do |format| 
      format.js 
    end 
  end 

  private 

  def answer_params
    params.require(:answer).permit(:content, :student_id, :assessment_id, :question_id, :total_point_value)
  end 
end 

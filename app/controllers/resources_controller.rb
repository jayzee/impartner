# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  content     :string
#  type_of     :string
#  lesson_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  order_id    :integer
#  description :string
#  title       :string
#

class ResourcesController < ApplicationController

  before_action :authorized_to_interact, only: [:edit] 


  def new
    @lesson = find_lesson
    @resource = @lesson.resources.build()
  end 

  def create
    @lesson = find_lesson
    @resource = @lesson.resources.build(resource_params)
    @lesson.save
    redirect_to lesson_path(@lesson)
  end 

  def edit

  end

  def complete
    @student = Student.find_by(user_id: session[:user_id])
    @student.complete_resource(params[:id])
  end

  private

  def find_lesson
    Lesson.find(params[:lesson_id])
  end 

  def resource_params
    params.require(:resource).permit(:type_of, :description, :title, :content)
  end 

  def authorized_to_edit
    @resource=Resource.find(params[:id])
    @teacher= Teacher.find(@resource.lesson.track.teacher_id)
    if session[:user_id] != @teacher.user_id
        redirect_to root_path, notice: "You must be a Track's teacher in order to edit its contents" 
    end
  end

end

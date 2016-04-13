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
#

class LessonsController < ApplicationController
  before_action :authorized_to_interact, only: [:edit]

  def show
    @lesson = Lesson.find(params[:id])
    resources = @lesson.resources
    assessments = @lesson.assessments
    @student = Student.find_by(user_id: current_user.id)
    joins = resources.map do |r|
      StudentsResource.find_by(resource_id: r.id, student_id: @student.id)
    end
    @completed_joins= joins.find_all{|r| r.completed}
    @complete_resources= @completed_joins.map {|j| j.resource}
    @incomplete_joins= joins.find_all{|r| r.completed == false}
    @incomplete_resources= @incomplete_joins.map {|j| j.resource}
    binding.pry
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

  def authorized_to_edit
    @lesson=Lesson.find(params[:id])
    @teacher= Teacher.find(@lesson.track.teacher_id)
    if session[:user_id] != @teacher.user_id
        redirect_to root_path, notice: "You must be a Track's teacher in order to edit its contents" 
    end
  end
end

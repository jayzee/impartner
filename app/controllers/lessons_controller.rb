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
    @assessments = @lesson.assessments
    @answer = Answer.new
    @student = Student.find_by(user_id: current_user.id)




    #       @student = Student.create(user_id: current_user.id)

          joins = resources.select do |r|
            StudentsResource.find_by(resource_id: r.id, student_id: @student.id)
          end

              @completed_joins= joins.find_all{|r| r.students_resources[0].completed}
              @complete_resources= @completed_joins.map {|j| j}
              @incomplete_joins= joins.find_all{|r| r.students_resources[0].completed == false}
              @incomplete_resources= @incomplete_joins.map {|j| j}




  end

  def new

    @track= Track.find(params[:track_id])
    @lesson = @track.lessons.build()
  end

  def create

    @lesson = Lesson.new(title: params["title"], track_id: params["track_id"], duration: params["duration"])
    @track = @lesson.track
    @lesson.order_id = @track.lessons.length
    @lesson.save
    @teacher = @track.teacher
    #redirect_to lesson_path(@lesson)

    @return = { :error => false, :response => "Added", :partial => render_to_string(:partial => "link_to_new_lesson", :object => @teacher) }
    render json: {lesson: @lesson, return: @return}
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

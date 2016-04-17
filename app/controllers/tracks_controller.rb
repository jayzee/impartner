# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  privacy     :boolean
#  teacher_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  name        :string
#  description :string
#

class TracksController < ApplicationController


  before_action :authorized_to_interact, only: [:edit]

  def show
    @track = Track.find(params[:id])
    @lessons = @track.lessons.sort_by {|lesson| lesson.order_id}

    @is_enrolled = @track.is_user_a_student_of_track(current_user)
    student = Student.find_by(user_id: current_user.id)
    
    if student != nil
      @completion= student.percent_complete(@track)
    else
      @completion = 0
    end
    @teacher= Teacher.find(@track.teacher_id)
  end

  def new
    @cat = Category.find(params[:category_id])
    @track = @cat.tracks.new()
  end

  def create

    if current_user.teacher == nil
        Teacher.create(user_id: current_user.id)
    end
    @track = Track.create(name: params[:name], description: params[:description], image_url: params[:image_url], teacher_id: current_user.teacher.id, category_id: params[:category_id])

    if @track.valid?
      @track.save
      @lesson = @track.lessons.build()
      @teacher = current_user.teacher
      @return = { :error => false, :response => "Added", :partial => render_to_string(:partial => "link_to_new_lesson", :object => @teacher) }
      render json: {track: @track, teacher: current_user.teacher, return: @return}
    else
      render 'new'
    end
  end

  def enroll
    redirect_to track_path(@track)
  end

  private

  def track_params
    params.require(:track).permit(:name, :description, :category_id, :image_url)
  end

  def authorized_to_edit
    @track=Track.find(params[:id])
    @teacher= Teacher.find(@track.teacher_id)
    if session[:user_id] != @teacher.user_id
        redirect_to root_path, notice: "You must be a Track's teacher in order to edit its contents"
    end
  end

end

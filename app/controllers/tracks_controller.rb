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
#  completed   :boolean
#  name        :string
#  description :string
#

class TracksController < ApplicationController

  def show
    @track = Track.find(params[:id])
    @lessons = @track.lessons.sort_by {|lesson| lesson.order_id}
  end 

  def new
    @cat = Category.find(params[:category_id])
    @track = @cat.tracks.new()
  end

  def create
    @track = Track.create(track_params)
    redirect_to track_path(@track)
  end

  private
  
  def track_params
    params.require(:track).permit(:name, :description, :category_id)
  end
end

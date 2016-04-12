# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  points                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  provider               :string
#  uid                    :string
#

class UsersController < ApplicationController

  def show 
    @user = User.find(params[:id])
    if @user.student
      @learning = StudentsTrack.where(student_id: @user.student.id)
    end
    if @user.teacher
      @teaching = Track.where(teacher_id: @user.teacher.id)
    end
  end
  
end

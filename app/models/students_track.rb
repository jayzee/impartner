# == Schema Information
#
# Table name: students_tracks
#
#  id         :integer          not null, primary key
#  student_id :integer
#  track_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean          default(FALSE)
#

class StudentsTrack < ActiveRecord::Base
  belongs_to :student 
  belongs_to :track


end

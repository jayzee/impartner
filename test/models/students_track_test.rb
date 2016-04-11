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

require 'test_helper'

class StudentsTrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

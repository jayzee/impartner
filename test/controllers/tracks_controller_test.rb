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
#  image_url   :string
#

require 'test_helper'

class TracksControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end

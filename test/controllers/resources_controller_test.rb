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

require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  content    :string
#  type       :string
#  lesson_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  completed  :boolean
#

class ResourcesController < ApplicationController
end

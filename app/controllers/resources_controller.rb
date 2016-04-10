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
#  completed   :boolean          default(FALSE)
#  description :string
#  title       :string
#

class ResourcesController < ApplicationController
end

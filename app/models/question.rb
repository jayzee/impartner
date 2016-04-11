# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  content       :string
#  answer        :string
#  points_value  :integer
#  assessment_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Question < ActiveRecord::Base
  belongs_to :assessment

end

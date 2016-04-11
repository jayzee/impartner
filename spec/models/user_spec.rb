# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  points     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) do
    {
        name: "Bobbo",
        points: 0
    }
  end

let(:missing_name) { valid_user.except(:name)}
let(:missing_description) {valid_user.except(:points)}

  it "is valid when expected" do
      expect(User.new(valid_user)).to be_valid
  end

  it "is invalid without User name" do
      expect(User.new(missing_name)).to be_invalid
    end

  it "is invalid without User description" do
      expect(User.new(missing_description)).to be_invalid
  end

  it "can receive points from completing items" do
    bobbo = Student.new(:valid_student)
    course = Track.new(:open_course)
    bobbo.complete(course)
    expect(bobbo.points).to eq(course.total_value)
  end

end

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
      expect(valid_user).to be_valid
  end

  it "is invalid without User name" do
      expect(missing_name).to be_invalid
    end

  it "is invalid without User description" do
      expect(missing_description).to be_invalid
  end

  it "can receive points from completing items" do
    bobbo = Student.new(:valid_student)
    course = Track.new(:open_course)
    course.completed_by(bobbo)
    expect(bobbo.points).to eq(course.total_value)
  end

  describe "#complete" do 

    it "will set the passed in element's completed bool to True" do
      bobbo.complete 


  end

end

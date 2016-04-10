require 'rails_helper'

RSpec.describe Student, type: :model do

  let(:valid_student) do
      {
          name: "Bobbo",
          user_id: 1
      }
  end
  describe ""
  it "can join a public Track" do
    let(:open_course)do
    {
      privacy: false,
      teacher_id: 1,
      completed: false
      name: "Algebra",
      description: "Get your Math On.",
      completed: false

    }
  end




end
  
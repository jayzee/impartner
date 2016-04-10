require 'rails_helper'

RSpec.describe Student, type: :model do

  let(:valid_teacher) do
      {
          name: "Bobbo",
          user_id: 1
      }
  end

  let(:open_course)do
    {
      privacy: false,
      teacher_id: 1,
      completed: false
      name: "Algebra",
      description: "Get your Math On."

    }
  end
   let(:open_course2)do
    {
      privacy: false,
      teacher_id: 5,
      completed: false
      name: "Thai Food",
      description: "more like tom YUM"

    }
  end

    let(:closed_course)do
    {
      privacy: true,
      teacher_id: 2,
      completed: false
      name: "Two to Tango",
      description: "Private video lessons on Argentine Tango"
    }
  end
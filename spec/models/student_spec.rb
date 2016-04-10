require 'rails_helper'

RSpec.describe Student, type: :model do

  let(:valid_student) do
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

  it "can join a public Track" do
    bobbo = Student.new(:valid_student)
    course = Track.new(:open_course)
    bobbo.join_track(course)
    expect(course.students.last).to eq(bobbo)
  end

  it "cannot join a private Track" do
    bobbo = Student.new(:valid_student)
    course = Track.new(:closed_course)
    bobbo.join_track(course)
    expect(course.students).to eq([])
  end

  it "can join many tracks" do 
    course = Track.new(:open_course)
    course2= Track.new(:open_course2)
    bobbo.join_track(course)
    bobbo.join_track(course2)
    expect(bobbo.tracks.length).to eq(2)
  end

  it "receives points after finishing things" do
  end

end
  
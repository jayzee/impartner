# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe Student, type: :model do

  let(:valid_student){Student.new(name: "Bobbo",user_id: 1)}
  let(:open_course){Track.new(privacy: false,teacher_id: 1,completed: false,name: "Algebra",description: "Get your Math On.")}
  let(:open_course2){Track.new(privacy: false, teacher_id: 5, completed: false, name: "Thai Food", description: "more like tom YUM")}
  let(:closed_course){Track.new(privacy: true,teacher_id: 2,completed: false,name: "Two to Tango",description: "Private video lessons on Argentine Tango")}

  it "can join a public Track" do
    bobbo.join_track(course)
    expect(course.students.last).to eq(bobbo)
  end

  it "cannot join a private Track" do
    bobbo.join_track(course)
    expect(course.students).to eq([])
  end

  it "can join many tracks" do
    bobbo.join_track(course)
    bobbo.join_track(course2)
    expect(bobbo.tracks.length).to eq(2)
  end

  describe "#complete" do

    let(:video){Resource.new(id: 1, title:"Amazing Video", description: "This video will teach you stuff!", content: "https://www.youtube.com/watch?v=Cg8sAM8E9ko", type_of: "video")}
    let(:bobbo){Student.new(id: 1, name: "Bobbo", user_id: 1)}
    let(:join){StudentsResource.new(student_id: 1, resource_id: 1, completed: false)}

    it "can properly mark a student's resource join as completed" do 
      bobbo.complete(video)
      expect(join.completed).to eq(true)      
    end

  end

  describe "#check_sibling_completion" do
    let(:video){Resource.new(id: 1, title:"Amazing Video", description: "This video will teach you stuff!", content: "https://www.youtube.com/watch?v=Cg8sAM8E9ko", type_of: "video")}
    let(:bobbo){Student.new(id: 1, name: "Bobbo", user_id: 1)}
    let(:join){StudentsResource.new(student_id: 1, resource_id: 1, completed: false)}
    
    expect(check_sibling_completion(video)).to be_a(boolean)
  end

  describe "#check_resource_completion" do
    let(:join){StudentsResource.new(student_id: 1, resource_id: 1, completed: false)}

    it "returns false for uncompleted resources" do
      expect(check_resource_completion(join)).to eq(false)
    end

    it "returns true for completed resources" do 
      join.completed = true
      expect(check_resource_completion(join)).to eq(true)
    end
      
  end
end
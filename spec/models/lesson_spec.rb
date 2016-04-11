# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  title      :string
#  track_id   :integer
#  duration   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  completed  :boolean
#

require 'rails_helper'

RSpec.describe Lesson, type: :model do

  let(:variable_lesson) do
    {
        title: "variables",
        duration: "20 minutes",
        track_id: 1
        completed: 1

    }
  end

  let(:algebra_track_not_completed) do
    {
        id: 1,
        privacy: false,
        category_id: 1,
        name: "Algebra",
        description: "Learn a lot of algebra!"
    }
  end



  it "is valid when created" do
    expect(Lesson.new(variable_lesson).to be_valid)

  end

  it "the name of the lesson should equal variables" do
    expect(:variable_lesson.title).toBe("variables");
    expect(:variable_lesson.duration).toBe("20 minutes");
  end

  it "is the lesson associated with a track" do
    expect(:variable_lesson).toBe(1)
  end

  it "is the lesson not completed" do
    expect(:variable_lesson).toBe("false")
  end

  it "is the next lesson in the track correct based on order id" do

  end

end

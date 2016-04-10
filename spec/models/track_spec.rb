# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  privacy     :boolean
#  teacher_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  completed   :boolean
#  name        :string
#  description :string
#

require 'rails_helper'

RSpec.describe Track, type: :model do
  let(:valid_track) do
    {
        name: "Algebra",
        description: "Learn a lot of algebra!"
    }
  end

let(:missing_name) { valid_track.except(:name)}
let(:missing_description) {valid_track.except(:description)}

  it "is valid when expected" do
      expect(Track.new(valid_track)).to be_valid
  end

  it "is invalid without track name" do
      expect(Track.new(missing_name)).to be_invalid
    end

  it "is invalid without track description" do
      expect(Track.new(missing_description)).to be_invalid
  end

  it "is invalid without a category" do

  end

  it "has to have lessons" do

  end

  context "teacher functionality" do
      it "a teacher who created a track can add a lesson" do
      end

      it "order lessons can be rearranged by the teacher" do
      end

      it "a teacher can delete a lesson" do

      end

      it "a teacher can set privacy" do
      end

      it "a teacher can add students to a private track" do

      end
  end

    context "students functionality" do
      it "unauthorized students cannot use a track" do

      end

      it "students can enroll in a public track" do

      end

      it "a track will be marked complete if all it's lessons and resources are completed" do

      end

      it "a teacher should be flagged if a user completes a track" do

      end

      it "student's progress bar is marked complete when track is finished" do

      end
    end


end

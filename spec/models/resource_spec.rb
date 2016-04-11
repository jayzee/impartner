require 'rails_helper'

RSpec.describe Resource, type: :model do

  let(:valid_resource) do
      {
        content: "www.youtube.com",
        type_of: "Video",
        lesson_id: "1",
        title: "Variables"
      }
  end

  let(:invalid_type) do 
    {
      content: "www.youtube.com",
      type_of: "Whatever",
      lesson_id: "1",
      title: "Variables"
    }
  end 

  it 'should have content' do
    resource = Resource.new(valid_resource)
    expect(resource.content).to eq('www.youtube.com') 
  end 

  it 'should have valid type' do 
    resource = Resource.new(valid_resource)
    invalid_resource = Resource.new(invalid_type)
    expect(resource.type_of).to eq('Video')
    expect(invalid_resource.valid?).to be(false)
  end 


end
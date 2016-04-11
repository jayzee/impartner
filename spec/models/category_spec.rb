# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:category_new) do
      {
          title: "Language"

      }
  end

it "there are 6 categories" do
  expect(Categories.all).to eq(6)
end

end

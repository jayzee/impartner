# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end 

  def show
    @category = Category.find(params[:id])
    @tracks = @category.tracks
  end 

end

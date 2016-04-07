class AddCompletedColumnToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :completed, :boolean
  end
end

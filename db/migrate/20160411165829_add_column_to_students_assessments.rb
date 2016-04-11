class AddColumnToStudentsAssessments < ActiveRecord::Migration
  def change
    add_column :students_assessments, :points, :integer
  end
end

class ChangeColumnDefaultInResourcesAndAssessments < ActiveRecord::Migration
  def change
    change_column_default(:resources, :completed, false)
    change_column_default(:assessments, :completed, false)
  end
end

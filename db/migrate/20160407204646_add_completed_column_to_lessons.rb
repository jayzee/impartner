class AddCompletedColumnToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :completed, :boolean
  end
end

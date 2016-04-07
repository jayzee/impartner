class AddCompletedColumnToResources < ActiveRecord::Migration
  def change
    add_column :resources, :completed, :boolean
  end
end

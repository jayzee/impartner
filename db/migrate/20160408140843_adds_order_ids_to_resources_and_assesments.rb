class AddsOrderIdsToResourcesAndAssesments < ActiveRecord::Migration
  def change
    add_column :assessments, :order_id, :integer
  end
end

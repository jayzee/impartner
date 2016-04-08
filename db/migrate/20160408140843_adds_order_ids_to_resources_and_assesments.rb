class AddsOrderIdsToResourcesAndAssesments < ActiveRecord::Migration
  def change
    add_column :AddsOrderIdsToResourcesAndAssesmentsments, :order_id, :integer
  end
end

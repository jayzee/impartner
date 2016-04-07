class AddOrderIdColumnToResources < ActiveRecord::Migration
  def change
    add_column :resources, :order_id, :integer
  end
end

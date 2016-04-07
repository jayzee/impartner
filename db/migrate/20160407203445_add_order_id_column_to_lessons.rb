class AddOrderIdColumnToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :order_id, :integer
  end
end

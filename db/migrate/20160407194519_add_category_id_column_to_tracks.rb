class AddCategoryIdColumnToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :category_id, :integer
  end
end

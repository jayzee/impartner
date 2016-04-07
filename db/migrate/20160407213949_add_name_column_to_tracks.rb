class AddNameColumnToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :name, :string
    add_column :tracks, :description, :string
  end
end

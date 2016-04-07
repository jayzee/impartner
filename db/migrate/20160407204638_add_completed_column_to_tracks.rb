class AddCompletedColumnToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :completed, :boolean
  end
end

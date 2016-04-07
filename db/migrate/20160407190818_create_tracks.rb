class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.boolean :privacy 
      t.integer :teacher_id
      t.timestamps null: false
    end
  end
end

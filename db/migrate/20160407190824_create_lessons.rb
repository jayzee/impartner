class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :track_id
      t.string :duration 
      t.timestamps null: false
    end
  end
end

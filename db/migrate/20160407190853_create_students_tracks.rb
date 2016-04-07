class CreateStudentsTracks < ActiveRecord::Migration
  def change
    create_table :students_tracks do |t|
      t.integer :student_id
      t.integer :track_id
      t.timestamps null: false
    end
  end
end

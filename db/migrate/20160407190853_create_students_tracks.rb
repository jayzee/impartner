class CreateStudentsTracks < ActiveRecord::Migration
  def change
    create_table :students_tracks do |t|

      t.timestamps null: false
    end
  end
end

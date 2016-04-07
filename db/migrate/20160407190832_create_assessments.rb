class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :lesson_id
      t.boolean :challenge?
      t.timestamps null: false
    end
  end
end

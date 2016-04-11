class CreateStudentsLessonsStudentsResourcesStudentsAssessmentsTables < ActiveRecord::Migration
  def change
    create_table :students_lessons do |t|
      t.integer :student_id
      t.integer :lesson_id
      t.boolean :completed, default: false
    end

    create_table :students_resources do |t|
      t.integer :student_id
      t.integer :resource_id
      t.boolean :completed, default: false
    end

    create_table :students_assessments do |t|
      t.integer :student_id
      t.integer :assessment_id
      t.boolean :completed, default: false
    end

    add_column :students_tracks, :completed, :boolean, default: false

    remove_column :tracks, :completed, :boolean
    remove_column :lessons, :completed, :boolean
    remove_column :resources, :completed, :boolean
    remove_column :assessments, :completed, :boolean

  end
end

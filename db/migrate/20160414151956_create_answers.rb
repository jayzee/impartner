class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :student_id
      t.integer :assessment_id
      t.integer :total_point_value
      t.timestamps null: false
    end
  end
end

class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :assessment_id
      t.timestamps null: false
    end
  end
end

class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :content
      t.string :type
      t.integer :lesson_id
      t.timestamps null: false
    end
  end
end

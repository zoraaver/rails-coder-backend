class CreateUserLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :user_lessons do |t|
      t.integer :lesson_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class RemoveUserLessonStatus < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_lessons, :status
  end
end

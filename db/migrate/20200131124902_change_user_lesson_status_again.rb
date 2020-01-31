class ChangeUserLessonStatusAgain < ActiveRecord::Migration[6.0]
  def down
    remove_column :user_lessons, :status
  end
end

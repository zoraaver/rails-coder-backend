class ChangeUserLessonStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :user_lessons, :status, :string, default: "ongoing"
  end
end

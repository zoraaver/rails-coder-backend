class ChangeStatusInUserLesson < ActiveRecord::Migration[6.0]
  def change
    change_column :user_lessons, :status, :integer, default: 1
  end
end

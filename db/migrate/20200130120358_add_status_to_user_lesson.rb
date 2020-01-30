class AddStatusToUserLesson < ActiveRecord::Migration[6.0]
  def change
    add_column :user_lessons, :status, :integer, default: 0
  end
end

class AddStatusAgainToUserLesson < ActiveRecord::Migration[6.0]
  def change
    add_column :user_lessons, :status, :integer
  end
end

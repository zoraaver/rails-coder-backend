class AddCodeToUserLesson < ActiveRecord::Migration[6.0]
  def change
    add_column :user_lessons, :code, :text
  end
end

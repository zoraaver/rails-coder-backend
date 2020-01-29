class ChangeContentInLessons < ActiveRecord::Migration[6.0]
  def change
    change_column :lessons, :content, :text
  end
end

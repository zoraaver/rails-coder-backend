class RemoveLessonContent < ActiveRecord::Migration[6.0]
  def change
    remove_column :lessons, :content
  end
end

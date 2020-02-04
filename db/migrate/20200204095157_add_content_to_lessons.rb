class AddContentToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :content, :text
  end
end

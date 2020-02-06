class AddSortIdToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :sort_id, :integer, default: 0
  end
end

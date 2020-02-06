class AddIndexToSortIds < ActiveRecord::Migration[6.0]
  def change
    add_index :sections, :sort_id
    add_index :subsections, :sort_id
    add_index :lessons, :sort_id
  end
end

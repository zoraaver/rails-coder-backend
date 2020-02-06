class AddSortIdToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :sort_id, :integer, default: 0
  end
end

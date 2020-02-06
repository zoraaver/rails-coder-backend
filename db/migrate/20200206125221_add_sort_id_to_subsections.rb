class AddSortIdToSubsections < ActiveRecord::Migration[6.0]
  def change
    add_column :subsections, :sort_id, :integer, default: 0
  end
end

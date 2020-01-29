class CreateSubsections < ActiveRecord::Migration[6.0]
  def change
    create_table :subsections do |t|
      t.string :title
      t.integer :section_id
    end
  end
end

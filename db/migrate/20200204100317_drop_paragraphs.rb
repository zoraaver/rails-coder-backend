class DropParagraphs < ActiveRecord::Migration[6.0]
  def change
    drop_table :paragraphs
  end
end

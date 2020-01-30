class AddCodeToParagraphs < ActiveRecord::Migration[6.0]
  def change
    add_column :paragraphs, :code, :text
  end
end

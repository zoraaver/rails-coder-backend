class CreateParagraphs < ActiveRecord::Migration[6.0]
  def change
    create_table :paragraphs do |t|
      t.text :content
      t.integer :lesson_id
    end
  end
end

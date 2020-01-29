class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :content
      t.integer :subsection_id
      t.timestamps
    end
  end
end

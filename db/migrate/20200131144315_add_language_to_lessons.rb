class AddLanguageToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :language, :string
  end
end

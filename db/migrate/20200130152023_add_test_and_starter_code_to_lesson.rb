class AddTestAndStarterCodeToLesson < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :test, :text
    add_column :lessons, :starter_code, :text
  end
end

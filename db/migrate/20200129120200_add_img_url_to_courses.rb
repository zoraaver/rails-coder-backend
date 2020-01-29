class AddImgUrlToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :img_url, :string
  end
end

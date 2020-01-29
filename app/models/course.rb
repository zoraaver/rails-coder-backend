class Course < ApplicationRecord
  has_many :user_courses
  has_many :sections
  has_many :subsections, through: :sections
  has_many :lessons, through: :subsections
end

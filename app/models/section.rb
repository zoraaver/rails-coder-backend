class Section < ApplicationRecord
  belongs_to :course
  has_many :subsections
  has_many :lessons, through: :subsections
end

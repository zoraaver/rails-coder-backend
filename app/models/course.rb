class Course < ApplicationRecord
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :sections
  has_many :subsections, through: :sections
  has_many :lessons, through: :subsections

  def completed?(user)
    total = UserLesson.where(lesson_id: self.lessons.pluck(:id), user_id: user.id).sum(:status)
    count = self.lessons.count
    if total == 0 
      return 0
    elsif total == 2*count 
      return 2
    else 
      return 1
    end
  end

end

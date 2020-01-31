class Subsection < ApplicationRecord
  belongs_to :section
  has_many :lessons

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

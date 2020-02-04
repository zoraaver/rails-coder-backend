class Lesson < ApplicationRecord
  belongs_to :subsection
  has_many :user_lessons

  def completed?(user)
    user_lesson = self.user_lessons.find_by(user_id: user.id)
    if user_lesson
      return user_lesson.status
    end
    return 0
  end

end

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

  def next_lesson
    lesson = subsection.lessons.where("sort_id > ?", self.sort_id).order(sort_id: :asc).pluck(:id, :title).first
    if (!lesson)         
      next_subsection = subsection.next_subsection 
      return nil if !next_subsection
      lesson = next_subsection.lessons.order(sort_id: :asc).pluck(:id, :title).first
    end
    return {id: lesson[0], title: lesson[1]} if lesson
  end

  def previous_lesson
    lesson = subsection.lessons.where("sort_id < ?", self.sort_id).order(sort_id: :desc).pluck(:id, :title).first
    if (!lesson)         
      previous_subsection = subsection.previous_subsection 
      return nil if !previous_subsection
      lesson = previous_subsection.lessons.order(sort_id: :desc).pluck(:id, :title).first
    end
    return {id: lesson[0], title: lesson[1]} if lesson
  end

end

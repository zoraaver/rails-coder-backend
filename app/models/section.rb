class Section < ApplicationRecord
  belongs_to :course
  has_many :subsections
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

  def next_section
    course.sections.where("sort_id > ?", self.sort_id).order(sort_id: :asc).first
  end

  def previous_section
    course.sections.where("sort_id < ?", self.sort_id).order(sort_id: :desc).first
  end
end

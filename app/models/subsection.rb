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

  def next_subsection
    subsection = section.subsections.where("sort_id > ?", self.sort_id).order(sort_id: :asc).first
    if !subsection
      next_section = section.next_section
      return nil if !next_section
      subsection = next_section.subsections.order(sort_id: :asc).first
    end
    subsection
  end

  def previous_subsection
    subsection = section.subsections.where("sort_id < ?", self.sort_id).order(sort_id: :desc).first
    if !subsection
      previous_section = section.previous_section
      return nil if !previous_section
      subsection = previous_section.subsections.order(sort_id: :desc).first
    end
    subsection
  end
end

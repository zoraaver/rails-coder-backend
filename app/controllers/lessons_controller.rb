class LessonsController < ApplicationController

  def show

    lesson = Lesson.find(params[:id])

    lesson.user_lessons.find_by(user: @current_user) || UserLesson.create(user: @current_user, lesson: lesson)
    code = lesson.user_lessons.where(user: @current_user).pluck(:code)[0] 

    render json: {
      test: !!lesson.test, 
      starter_code: lesson.starter_code, 
      code: code,
      content: lesson.content,
      id: lesson.id, title: lesson.title, 
      language: lesson.language
    }

  end
end

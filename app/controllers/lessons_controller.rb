class LessonsController < ApplicationController

  def show

    lesson = Lesson.find(params[:id])

    user_lesson = lesson.user_lessons.find_by(user: @current_user) || UserLesson.create(user: @current_user, lesson: lesson)

    render json: {
      test: !!lesson.test, 
      status: user_lesson.status,
      starter_code: lesson.starter_code, 
      code: user_lesson.code,
      content: lesson.content,
      id: lesson.id, title: lesson.title, 
      language: lesson.language
    }

  end

  def update
    lesson = Lesson.find(lesson_params[:id])
    user_lesson = lesson.user_lessons.find_by(user: @current_user)
    user_lesson.update(status: 2)
    render json: {message: "Lesson completed successfully"}
  end

  private

  def lesson_params
    params.require(:lesson).permit(:status, :id)
  end

end

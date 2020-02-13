class LessonsController < ApplicationController
  before_action :require_login
  before_action :require_admin, only: [:edit, :create, :update, :destroy]

  def create
    lesson = Lesson.create(lesson_params)
    last_sort_id = Subsection.find(lesson_params[:subsection_id]).lessons.order(:sort_id).pluck(:sort_id).last
    lesson.update(sort_id: (last_sort_id && last_sort_id + 1) || 0)
    render json: lesson.id
  end

  def edit
    lesson = Lesson.find(params[:id])
    render json: {
      test: lesson.test,
      starter_code: lesson.starter_code,
      subsection_id: lesson.subsection.id,
      title: lesson.title,
      content: lesson.content,
      language: lesson.language
    }
  end

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
      language: lesson.language,
      nextLesson: lesson.next_lesson,
      previousLesson: lesson.previous_lesson
    }

  end

  def update
    lesson = Lesson.find(params[:id])
    lesson.update(lesson_params)
    render json: lesson.id
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    render json: lesson.id
  end

  def complete_lesson
    lesson = Lesson.find(lesson_params[:id])
    user_lesson = lesson.user_lessons.find_by(user: @current_user)
    user_lesson.update(status: 2)
    render json: {message: "Lesson completed successfully"}
  end

  private

  def lesson_params
    params.require(:lesson).permit(:sort_id, :title, :status, :id, :subsection_id, :content, :test, :language, :starter_code)
  end

end

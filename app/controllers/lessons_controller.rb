class LessonsController < ApplicationController
  def show
    lesson = Lesson.find(params[:id])
    render json: {id: lesson.id, title: lesson.title, content: lesson.content}
  end
end

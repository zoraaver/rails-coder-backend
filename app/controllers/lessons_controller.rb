class LessonsController < ApplicationController
  def show
    lesson = Lesson.find(params[:id])
    render json: {id: lesson.id, title: lesson.title, paragraphs: lesson.paragraphs.map{|p| ParagraphSerializer.new(p)}}
  end
end

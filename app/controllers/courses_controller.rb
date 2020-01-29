class CoursesController < ApplicationController
  def index
    courses = Course.all
    render json: courses
  end

  def show
    course = Course.find(params[:id])
    render json: {id: course.id, sections: course.sections.map{|s| SectionSerializer.new(s)} }
  end
end

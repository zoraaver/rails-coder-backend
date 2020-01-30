class CoursesController < ApplicationController
  def index
    courses = Course.all
    render json: courses.map{ |c| {id: c.id, title: c.title, description: c.description, img_url: c.img_url} }
  end

  def show
    course = Course.find(params[:id])
    render json: course, scope: {user: @current_user}
  end
end

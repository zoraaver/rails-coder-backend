class CoursesController < ApplicationController

  before_action :require_login

  def index
    courses = Course.all
    render json: courses.map{ |c| {id: c.id, title: c.title, description: c.description, img_url: c.img_url} }
  end

  def show
    course = Course.find(params[:id])
    UserCourse.find_by(course: course, user: @current_user) || UserCourse.create(user: @current_user, course: course)
    render json: course, scope: {user: @current_user}
  end
end

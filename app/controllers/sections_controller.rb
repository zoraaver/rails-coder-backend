class SectionsController < ApplicationController
  before_action :require_login
  before_action :require_admin

  def create
    last_sort_id = Course.find(section_params[:course_id]).sections.order(:sort_id).pluck(:sort_id).last
    section = Section.create(title: section_params[:title], sort_id: last_sort_id + 1 || 0, course_id: section_params[:course_id])
    render json: section, scope: {user: @current_user}
  end

  def update
    byebug
  end

  def destroy
    section = Section.find(params[:id])
    section.destroy
    render json: section.id
  end

  private

  def section_params
    params.require(:section).permit(:title, :course_id, :sort_id)
  end
end

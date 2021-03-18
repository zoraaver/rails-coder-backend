class SubsectionsController < ApplicationController
  before_action :require_login
  before_action :require_admin

  def create
    last_sort_id = Section.find(subsection_params[:section_id]).subsections.order(:sort_id).pluck(:sort_id).last
    subsection = Subsection.create(
      title: subsection_params[:title], 
      sort_id: (last_sort_id && last_sort_id + 1) || 0,
      section_id: subsection_params[:section_id]
    )
    render json: {subsection: SubsectionSerializer.new(subsection, scope: {user: @current_user}), section_id: subsection.section_id}
  end

  def update
    subsection = Subsection.find(params[:id])
    subsection.update(subsection_params)
    render json: {section_id: subsection.section.id, id: subsection.id, title: subsection.title}
  end

  def destroy
    subsection = Subsection.find(params[:id]) 
    subsection.destroy
    render json: {section_id: subsection.section_id, id: subsection.id}
  end

  private

  def subsection_params
    params.require(:subsection).permit(:id, :title, :section_id, :sort_id)
  end
end

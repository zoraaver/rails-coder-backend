class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :img_url, :description, :sections, :completed

  def sections
    object.sections.map{|s| SectionSerializer.new(s, scope: @instance_options[:scope])}
  end

  def completed
    object.completed?(@instance_options[:scope][:user])
  end
end

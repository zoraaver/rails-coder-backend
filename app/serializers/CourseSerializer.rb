class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :img_url, :description, :sections

  def sections
    object.sections.map{|s| SectionSerializer.new(s, scope: @instance_options[:scope])}
  end

end

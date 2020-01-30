class SectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :subsections

  def subsections
    object.subsections.map{ |s| SubsectionSerializer.new(s, scope: @instance_options[:scope]) }
  end
end

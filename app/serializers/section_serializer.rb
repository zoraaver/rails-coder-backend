class SectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :subsections, :completed, :sort_id

  def subsections
    object.subsections.order(sort_id: :asc).map{ |s| SubsectionSerializer.new(s, scope: @instance_options[:scope]) }
  end

  def completed
    object.completed?(@instance_options[:scope][:user])
  end
end

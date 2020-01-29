class SectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :subsections

  def subsections
    object.subsections.map{ |s| SubsectionSerializer.new(s) }
  end
end

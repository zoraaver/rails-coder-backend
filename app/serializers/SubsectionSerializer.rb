class SubsectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :lessons

  def lessons
    object.lessons.map{|l| LessonSerializer.new(l, scope: @instance_options[:scope])}
  end
end

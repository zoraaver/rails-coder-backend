class SubsectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :lessons, :completed

  def lessons
    object.lessons.map{|l| LessonSerializer.new(l, scope: @instance_options[:scope])}
  end

  def completed
    object.completed?(@instance_options[:scope][:user])
  end
end

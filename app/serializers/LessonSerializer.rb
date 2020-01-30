class LessonSerializer < ActiveModel::Serializer
  attributes :title, :id, :completed


  def completed
    object.completed?(@instance_options[:scope][:user])
  end
end

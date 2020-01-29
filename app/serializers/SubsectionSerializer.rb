class SubsectionSerializer < ActiveModel::Serializer
  has_many :lessons
  attributes :id, :title
end

class UserSerializer < ActiveModel::Serializer
  has_many :courses
  attributes :email, :token, :courses
end

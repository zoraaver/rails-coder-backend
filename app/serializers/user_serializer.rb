class UserSerializer < ActiveModel::Serializer
  attributes :email, :token
end

class UserSerializer < ActiveModel::Serializer
  attributes :email, :token, :courses, :admin

  def courses
    object.courses.map{|c| {id: c.id, title: c.title, description: c.description, img_url: c.img_url}}
  end

end

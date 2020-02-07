class User < ApplicationRecord

  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  has_many :user_lessons, dependent: :destroy
  has_many :lessons, through: :user_lessons

  has_secure_password
  validates :email, presence: true, uniqueness: true

  def token
    JWT.encode({user_id: self.id}, ENV["CODER"])
  end

end

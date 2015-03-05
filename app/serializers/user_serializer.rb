class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :password_digest, :id

  has_many :rant
end

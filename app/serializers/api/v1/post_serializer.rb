class Api::V1::PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_login

   def user_login
     object.user.login
  end
end

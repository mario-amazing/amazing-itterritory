class Api::V1::TopPostsSerializer < ActiveModel::Serializer
  attributes :title, :description
end

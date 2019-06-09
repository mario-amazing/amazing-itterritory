# frozen_string_literal: true

class Api::V1::PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :author_login

  def author_login
    object.user.login
 end
end

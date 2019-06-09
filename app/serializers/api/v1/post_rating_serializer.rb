# frozen_string_literal: true

class Api::V1::PostRatingSerializer < ActiveModel::Serializer
  attributes :average_grade
end

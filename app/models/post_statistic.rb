# frozen_string_literal: true

class PostStatistic < ApplicationRecord
  belongs_to :post

  validates :rating_count, :average_grade, presence: true
end

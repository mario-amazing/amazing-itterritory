class Rating < ApplicationRecord
  belongs_to :post
  validates :grade, inclusion: { in: 1..5 }
end

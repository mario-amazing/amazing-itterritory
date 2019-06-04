class Post < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_one :post_statistic
  has_one :user_ip

  validates :title, :description, presence: true
end

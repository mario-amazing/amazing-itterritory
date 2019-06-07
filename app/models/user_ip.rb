class UserIp < ApplicationRecord
  belongs_to :post
  belongs_to :user #denormalization for list ip query

  validates :ip, presence: true
end

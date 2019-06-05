class UserIp < ApplicationRecord
  validates :ip, presence: true
  belongs_to :post
  belongs_to :user #denormalization for list ip query
end

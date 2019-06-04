class UserIp < ApplicationRecord
  belongs_to :post
  belongs_to :user #denormalization for list ip query
end

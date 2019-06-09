# frozen_string_literal: true

FactoryBot.define do
  factory :user_ip, class: 'UserIp' do
    association :user, factory: :user
    association :post, factory: :post

    ip { '141.202.126.126' }
  end
end

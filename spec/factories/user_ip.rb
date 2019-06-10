# frozen_string_literal: true

FactoryBot.define do
  factory :user_ip, class: 'UserIp' do
    association :user, factory: :user
    association :post, factory: :post

    ip { '141.202.126.126' }
    trait :user_ip_max do
      association :user, factory: :user_max
    end
  end
end

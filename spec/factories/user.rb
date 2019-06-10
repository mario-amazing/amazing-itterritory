# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    login { 'John' }
  end

  factory :user_max, class: 'User' do
    login { 'Max' }
  end
end

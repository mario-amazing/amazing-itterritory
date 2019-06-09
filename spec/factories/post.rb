FactoryBot.define do
  factory :post, class: 'Post' do
    association :user, factory: :user
    title { 'title_factory' }
    description { 'description_factory' }
    
    trait :with_post_statistic do
      association :post_statistic, factory: :post_statistic
    end
  end
end

FactoryBot.define do
  factory :post, class: 'Post' do
    association :user, factory: :user
    title { 'title_factory' }
    description { 'description_factory' }
  end
end

FactoryBot.define do
  factory :post_statistic, class: 'PostStatistic' do
    association :post, factory: :post
    average_grade { 5 }
    rating_count { 1 }
  end
end

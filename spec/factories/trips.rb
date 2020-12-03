FactoryBot.define do
  factory :trip do
    title { Faker::Music }
    start_date { Faker::Date.between(from: '2020-09-23', to: '2020-09-25') }
    end_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    memo { Faker::Lorem.sentence }
  end
end

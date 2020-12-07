FactoryBot.define do
  factory :spot do
    name { Faker::Music }
    category_id { Faker::Number.between(from: 0, to: 13) }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_time { Faker::Time.between(from: DateTime.now , to: DateTime.now + 1) }
    fee { Faker::Number.digit }
    link { Faker::Internet.url }
    memo { Faker::Lorem.sentence }
    association :plan
  end
end

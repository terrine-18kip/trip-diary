FactoryBot.define do
  factory :plan do
    daily { Faker::Number.digit }
    association :trip
  end
end

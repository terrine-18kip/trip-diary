FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { 'abc123' }

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/IMG_3444.jpg'), filename: 'IMG_3444.jpg')
    end
  end
end

FactoryBot.define do
  factory :user do
    provider { "google_oauth2" }
    sequence(:uid) { |n| "123456789#{n}" }
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end

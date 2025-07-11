FactoryBot.define do
  factory :story do
    title { Faker::Book.title }
    genre { Story.genres.keys.sample }
    thema { Faker::Lorem.sentence(word_count: 3) }
    synopsis { Faker::Lorem.paragraph(sentence_count: 3) }

    association :user
  end
end

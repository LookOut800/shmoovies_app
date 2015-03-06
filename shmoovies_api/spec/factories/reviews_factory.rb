FactoryGirl.define do
  factory :review do
    author Faker::Name.name
    body Faker::Lorem.sentence(2)
    rating Faker::Number.digit
    movie

  end
end

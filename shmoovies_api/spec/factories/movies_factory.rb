FactoryGirl.define do
  factory :movie do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraphs(3)
    author Faker::Name.name
  end
end

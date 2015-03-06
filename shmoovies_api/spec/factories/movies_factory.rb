FactoryGirl.define do
  factory :movie do
    title Faker::Commerce.product_name
    release_date Faker::Date.backward(1820)
    mpaa_rating Faker::Address.state_abbr
    description Faker::Company.bs
  end
end

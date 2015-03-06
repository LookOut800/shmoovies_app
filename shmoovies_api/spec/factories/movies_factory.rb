FactoryGirl.define do
  factory :movie do
    tmbd_id Faker::Number.digit.to_i
  end
end

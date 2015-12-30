FactoryGirl.define do
  factory :habit do
    user
    title Faker::Company.buzzword
  end
end

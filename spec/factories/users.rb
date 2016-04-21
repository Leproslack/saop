FactoryGirl.define do
  #sequence(:email) { |n| "test#{n}@dev.dev" }
  factory :user do
    email "test@dev.dev"
    password "password"
  end
end

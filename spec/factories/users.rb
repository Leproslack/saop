FactoryGirl.define do
  sequence(:email) { |n| "test#{n}@dev.dev" }
  factory :user do
    email
    password {Devise.friendly_token.first(8)}
  end
end

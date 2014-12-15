FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    sequence(:username) { |n| "user_name#{n}" }
    password "password"
    # admin false
  end
end

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    sequence(:auth_token) { |n| "token#{n}" }
    password { "MyString" }
  end
end

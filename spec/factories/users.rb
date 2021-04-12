FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    password { "MyString" }
  end
end

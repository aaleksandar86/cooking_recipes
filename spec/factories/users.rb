FactoryBot.define do
  factory :user do
    username { 'user1' }
    sequence(:email) { |n| "testing#{n}@test.com" }
    first_name { 'John' }
    last_name { 'Doe' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end

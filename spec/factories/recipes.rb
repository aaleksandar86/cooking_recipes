FactoryBot.define do
  factory :recipe do
    user

    title { 'New recipe' }
    description { 'New recipe description' }
  end
end

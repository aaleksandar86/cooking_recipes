FactoryBot.define do
  factory :ingredient do
    user
    recipe

    ingredient_name { 'New ingredient' }
  end
end

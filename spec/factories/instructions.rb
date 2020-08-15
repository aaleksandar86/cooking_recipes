FactoryBot.define do
  factory :instruction do
    user
    recipe

    body { 'New instruction' }
  end
end

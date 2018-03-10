FactoryBot.define do
  factory :idea do
    category 'object'
    text Faker::Name.name
    kind 'human'
  end
end

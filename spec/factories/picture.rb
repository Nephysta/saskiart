FactoryBot.define do
  factory :picture do
    data "data:image/png;base64,#{SecureRandom.base64(255)}"
  end
end

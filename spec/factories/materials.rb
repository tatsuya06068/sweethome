FactoryBot.define do
  factory :material do
    sequence(:name) { |n| "チョコ#{n}" }
  end
end

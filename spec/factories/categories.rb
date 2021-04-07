FactoryBot.define do
  factory :category do
    sequence(:name) {|n| "ケーキ#{n}" }
  end
end

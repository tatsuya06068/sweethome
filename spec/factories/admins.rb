FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "test#{n}@mail.com"}
    password {'password'} 
  end
end

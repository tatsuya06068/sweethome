FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "test#{n}@mail.com"}
    password {'password'} 
    admin_flg {true}
  end
end

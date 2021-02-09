FactoryBot.define do
    factory :product do
        name { '商品名' }
        displayfrom { '2021-01-01' }
        displayto { '2021-12-31' }
        association :category, factory: :category     
    end
end

FactoryBot.define do
  factory :purchase do
    postal_code {545-0021}
    city {'大阪市阿倍野区阪南町3丁目'}
    block {'26-2'}
    prefecture_id {28}
    phone_number {0666246800}
    association :user, :item
    
  end
end

FactoryBot.define do
  factory :purchase_address do
    postal_code {'545-0021'}
    city {'大阪市阿倍野区阪南町3丁目'}
    block {'26-2'}
    build {'なんとかビル2F'}
    prefecture_id {28}
    phone_number {'0666246800'}
  end
end
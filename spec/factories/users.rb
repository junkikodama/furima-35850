FactoryBot.define do
  factory :user do
    nickname {'テックキャンプ'}
    email {Faker::Internet.free_email}
    password {'abc123'}
    password_confirmation {password}
    last_name {'まこなり'}
    first_name {'社長'}
    last_name_kana {'マコナリ'}
    first_name_kana {'シャチョウ'}
    birthday {'2012-3-1'}
  end
end
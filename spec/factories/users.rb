FactoryBot.define do
  factory :user do
    nickname {'fuji太郎'}
    email {Faker::Internet.free_email}
    password {'gnm01xyz'}
    password_confirmation {password}
    family_name {'藤崎'}
    first_name {'幹太'}
    family_name_kana {'フジサキ'}
    first_name_kana {'カンタ'}
    birth_day {'1996-02-19'}
  end
end

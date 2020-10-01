FactoryBot.define do
  factory :item do
    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name { '小半' }
    description { 'gvjeofpkjjooerigedogji' }
    category_id { '2' }
    condition_id { '2' }
    postage_id { '2' }
    prefecture_id { '2' }
    handling_time_id { '2' }
    price { '3000' }
    association :user
  end
end

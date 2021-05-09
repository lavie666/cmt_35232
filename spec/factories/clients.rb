FactoryBot.define do
  factory :client do
    name  { 'トウカイテイオー' }
    name_hiragana  { 'とうかいていおー' }
    birthday { '1988-04-20'}
    prefecture_id {2}
    from_id {2}
    corporation { 'URA' }
    drink { 'はちみつ硬め濃いめ多め' }
    food { 'にんじん' }
    cigarettes { 'なし' }
    memo { '奇跡の名馬' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_1922.JPG'), filename: 'test_image.png')
    end
  end
end

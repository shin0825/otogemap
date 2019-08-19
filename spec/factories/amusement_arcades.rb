FactoryBot.define do
  factory :amusement_arcade do
    name { "テスト名前" }
    name_kana { "てすとかな" }
    address { "愛知県名古屋市中区" }
    latitude { 1 }
    longitude { 1 }
    association :prefecture, factory: :prefecture
  end
end

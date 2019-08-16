# Prefecture
Prefecture.create(:id => 21, :name => "岐阜県", :name_kana => "ギフケン")
Prefecture.create(:id => 22, :name => "静岡県", :name_kana => "シズオカケン")
Prefecture.create(:id => 23, :name => "愛知県", :name_kana => "アイチケン")
Prefecture.create(:id => 24, :name => "三重県", :name_kana => "ミエケン")

# AmusementArcade
AmusementArcade.create(
  :name => "コムテックタワー",
  :name_kana => "こむてっくたわー",
  :prefecture_id => 23,
  :address => "愛知県名古屋市中村区名駅４丁目１０−２０",
  :latitude => 35.169398,
  :longitude => 136.885995,
)

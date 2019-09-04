User.create!(email: 'hoge@fuga.com', password: 'foobar')

Prefecture.create(:id => 1, :name => '北海道', :name_kana => 'ホッカイドウ')
Prefecture.create(:id => 2, :name => '青森県', :name_kana => 'アオモリケン')
Prefecture.create(:id => 3, :name => '岩手県', :name_kana => 'イワテケン')
Prefecture.create(:id => 4, :name => '宮城県', :name_kana => 'ミヤギケン')
Prefecture.create(:id => 5, :name => '秋田県', :name_kana => 'アキタケン')
Prefecture.create(:id => 6, :name => '山形県', :name_kana => 'ヤマガタケン')
Prefecture.create(:id => 7, :name => '福島県', :name_kana => 'フクシマケン')
Prefecture.create(:id => 8, :name => '茨城県', :name_kana => 'イバラキケン')
Prefecture.create(:id => 9, :name => '栃木県', :name_kana => 'トチギケン')
Prefecture.create(:id => 10, :name => '群馬県', :name_kana => 'グンマケン')
Prefecture.create(:id => 11, :name => '埼玉県', :name_kana => 'サイタマケン')
Prefecture.create(:id => 12, :name => '千葉県', :name_kana => 'チバケン')
Prefecture.create(:id => 13, :name => '東京都', :name_kana => 'トウキョウト')
Prefecture.create(:id => 14, :name => '神奈川県', :name_kana => 'カナガワケン')
Prefecture.create(:id => 15, :name => '新潟県', :name_kana => 'ニイガタケン')
Prefecture.create(:id => 16, :name => '富山県', :name_kana => 'トヤマケン')
Prefecture.create(:id => 17, :name => '石川県', :name_kana => 'イシカワケン')
Prefecture.create(:id => 18, :name => '福井県', :name_kana => 'フクイケン')
Prefecture.create(:id => 19, :name => '山梨県', :name_kana => 'ヤマナシケン')
Prefecture.create(:id => 20, :name => '長野県', :name_kana => 'ナガノケン')
Prefecture.create(:id => 21, :name => '岐阜県', :name_kana => 'ギフケン')
Prefecture.create(:id => 22, :name => '静岡県', :name_kana => 'シズオカケン')
Prefecture.create(:id => 23, :name => '愛知県', :name_kana => 'アイチケン')
Prefecture.create(:id => 24, :name => '三重県', :name_kana => 'ミエケン')
Prefecture.create(:id => 25, :name => '滋賀県', :name_kana => 'シガケン')
Prefecture.create(:id => 26, :name => '京都府', :name_kana => 'キョウトフ')
Prefecture.create(:id => 27, :name => '大阪府', :name_kana => 'オオサカフ')
Prefecture.create(:id => 28, :name => '兵庫県', :name_kana => 'ヒョウゴケン')
Prefecture.create(:id => 29, :name => '奈良県', :name_kana => 'ナラケン')
Prefecture.create(:id => 30, :name => '和歌山県', :name_kana => 'ワカヤマケン')
Prefecture.create(:id => 31, :name => '鳥取県', :name_kana => 'トットリケン')
Prefecture.create(:id => 32, :name => '島根県', :name_kana => 'シマネケン')
Prefecture.create(:id => 33, :name => '岡山県', :name_kana => 'オカヤマケン')
Prefecture.create(:id => 34, :name => '広島県', :name_kana => 'ヒロシマケン')
Prefecture.create(:id => 35, :name => '山口県', :name_kana => 'ヤマグチケン')
Prefecture.create(:id => 36, :name => '徳島県', :name_kana => 'トクシマケン')
Prefecture.create(:id => 37, :name => '香川県', :name_kana => 'カガワケン')
Prefecture.create(:id => 38, :name => '愛媛県', :name_kana => 'エヒメケン')
Prefecture.create(:id => 39, :name => '高知県', :name_kana => 'コウチケン')
Prefecture.create(:id => 40, :name => '福岡県', :name_kana => 'フクオカケン')
Prefecture.create(:id => 41, :name => '佐賀県', :name_kana => 'サガケン')
Prefecture.create(:id => 42, :name => '長崎県', :name_kana => 'ナガサキケン')
Prefecture.create(:id => 43, :name => '熊本県', :name_kana => 'クマモトケン')
Prefecture.create(:id => 44, :name => '大分県', :name_kana => 'オオイタケン')
Prefecture.create(:id => 45, :name => '宮崎県', :name_kana => 'ミヤザキケン')
Prefecture.create(:id => 46, :name => '鹿児島県', :name_kana => 'カゴシマケン')
Prefecture.create(:id => 47, :name => '沖縄県', :name_kana => 'オキナワケン')

AmusementArcade.create(
  :name => "コムテックタワー",
  :name_kana => "こむてっくたわー",
  :prefecture_id => 23,
  :address => "愛知県名古屋市中村区名駅４丁目１０−２０",
  :latitude => 35.169398,
  :longitude => 136.885995,
  :homepage_url => "https://comtechtower.web.fc2.com",
  :twitter_url => "https://twitter.com/ComtechTower"
)
AmusementArcade.create(
  :name => "名古屋レジャーランドささしま店",
  :name_kana => "なごやれじゃーらんどささしまてん",
  :prefecture_id => 23,
  :address => "名古屋市中村区平池町4丁目60番14号マーケットスクエアささしま1階",
  :latitude => 35.162673,
  :longitude => 136.884998,
  :homepage_url => "https://www.leisurelan.co.jp/shop/sasasima.html",
  :twitter_url => "https://twitter.com/sasashima_l"
)
AmusementArcade.create(
  :name => "セガ金山",
  :name_kana => "せがかなやま",
  :prefecture_id => 23,
  :address => "愛知県名古屋市熱田区金山1-19-2",
  :latitude => 35.142718,
  :longitude => 136.902155,
  :homepage_url => "https://tempo.sega.jp/am/kanayama/",
  :twitter_url => "https://twitter.com/sega_kanayama"
)
AmusementArcade.create(
  :name => "ラウンドワン千種店",
  :name_kana => "らうんどわんちくさてん",
  :prefecture_id => 23,
  :address => "愛知県名古屋市千種区新栄3-20-17タイホウ千種駅南ビル8階",
  :latitude => 35.1680992,
  :longitude => 136.9279864,
  :homepage_url => "http://www.round1.co.jp/shop/tenpo/aichi-tikusa.html",
  :twitter_url => "https://twitter.com/r1_chigusa"
)
AmusementArcade.create(
  :name => "ADXマミー春日井出川店",
  :name_kana => "えーでぃーえっくすまみーかすがいでがわてん",
  :prefecture_id => 23,
  :address => "愛知県春日井市不二ガ丘１丁目５",
  :latitude => 35.2673271,
  :longitude => 137.0126829,
  :twitter_url => "https://twitter.com/ADXkasugai"
)
AmusementArcade.create(
  :name => "バッティングセンター甲子園",
  :name_kana => "ばってぃんぐせんたーこうしえん",
  :prefecture_id => 23,
  :address => "愛知県津島市寺野町五反田４３",
  :latitude => 35.189913,
  :longitude => 136.7750663,
  :twitter_url => "https://twitter.com/bc_koushien"
)
AmusementArcade.create(
  :name => "コムテックスクウェア",
  :name_kana => "こむてっくすくうぇあ",
  :prefecture_id => 23,
  :address => "愛知県名古屋市中区金山１丁目１６−８",
  :latitude => 35.144014,
  :longitude => 136.8999195,
  :twitter_url => "https://twitter.com/comtechsquare"
)
AmusementArcade.create(
  :name => "タイトーステーションフェドラ大須店",
  :name_kana => "たいとーすてーしょんふぇどらおおすてん",
  :prefecture_id => 23,
  :address => "愛知県名古屋市中区大須３丁目３０−３１",
  :latitude => 35.1595733,
  :longitude => 136.9051372,
  :homepage_url => "https://www.taito.co.jp/gc/store/00002180",
  :twitter_url => "https://twitter.com/taito_phoe_osu"
)
AmusementArcade.create(
  :name => "タイトーステーション大須店",
  :name_kana => "たいとーすてーしょんおおすてん",
  :prefecture_id => 23,
  :address => "愛知県名古屋市中区大須３丁目２０−７",
  :latitude => 35.159674,
  :longitude => 136.904832,
  :homepage_url => "https://www.taito.co.jp/gc/store/00002035",
  :twitter_url => "https://twitter.com/taito_osu"
)
AmusementArcade.create(
  :name => "ラウンドワン スタジアム 中川1号線店",
  :name_kana => "らうんどわんすたじあむなかがわいちごうてん",
  :prefecture_id => 23,
  :address => "愛知県名古屋市中川区法蔵町２丁目２３",
  :latitude => 35.123609,
  :longitude => 136.863605,
  :homepage_url => "https://www.round1.co.jp/shop/tenpo/aichi-nakagawa1.html",
  :twitter_url => "https://twitter.com/r1_nakagawa"
)
AmusementArcade.create(
  :name => "中川メトロポリス",
  :name_kana => "めとろぽりすなかがわ",
  :prefecture_id => 23,
  :address => "愛知県名古屋市中川区江松3−１１０",
  :latitude => 35.1251908,
  :longitude => 136.8236396,
  :homepage_url => "http://www.korona.co.jp/game/nak/index.asp",
  :twitter_url => "https://twitter.com/nakagawametoro"
)
ShopTag.create(:id => 1, :name => 'トイレあり')
ShopTag.create(:id => 2, :name => '禁煙')
ShopTag.create(:id => 3, :name => '分煙')
ShopTag.create(:id => 4, :name => '喫煙ルームあり')
ShopTag.create(:id => 5, :name => '灰皿あり')
ShopTag.create(:id => 6, :name => '荷物置き場あり')
ShopTag.create(:id => 7, :name => 'コインロッカーあり')
ShopTag.create(:id => 8, :name => '休憩スペースあり')
ShopTag.create(:id => 9, :name => 'サービスデーあり')
ShopTag.create(:id => 10, :name => '自販機あり')
ShopTag.create(:id => 11, :name => '食事処あり')

MachineTag.create(:id => 1, :name => '扇風機あり')
MachineTag.create(:id => 2, :name => '充電器あり')
MachineTag.create(:id => 3, :name => '荷物置き場あり')
MachineTag.create(:id => 4, :name => '待ち椅子あり')
MachineTag.create(:id => 5, :name => '台拭きあり')
MachineTag.create(:id => 6, :name => '画面みやすい')
MachineTag.create(:id => 7, :name => 'サービスデーあり')

IidxMonitor.create(:id => 0, :name => '不明')
IidxMonitor.create(:id => 1, :name => 'DJT液晶')
IidxMonitor.create(:id => 2, :name => 'EMP液晶')
IidxMonitor.create(:id => 3, :name => 'tricoro液晶')
IidxMonitor.create(:id => 4, :name => 'SPADA液晶')
IidxMonitor.create(:id => 5, :name => 'PENDUAL液晶')
IidxMonitor.create(:id => 6, :name => 'CB液晶')
IidxMonitor.create(:id => 98, :name => '非純正')
IidxMonitor.create(:id => 99, :name => 'その他')

IidxMachine.create(:id => 0, :name => '不明')
IidxMachine.create(:id => 1, :name => '初代筐体')
IidxMachine.create(:id => 2, :name => '10th筐体')
IidxMachine.create(:id => 3, :name => 'DD筐体')
IidxMachine.create(:id => 4, :name => 'GOLD筐体')
IidxMachine.create(:id => 5, :name => 'RA筐体')
IidxMachine.create(:id => 6, :name => 'tricoro筐体')
IidxMachine.create(:id => 7, :name => 'SPADA筐体')
IidxMachine.create(:id => 8, :name => 'copula筐体')

IidxVersion.create(:id => 0, :name => '不明')
IidxVersion.create(:id => 1, :name => '初代')
IidxVersion.create(:id => 2, :name => 'Substream')
IidxVersion.create(:id => 3, :name => '2nd')
IidxVersion.create(:id => 4, :name => '3rd')
IidxVersion.create(:id => 5, :name => '4th')
IidxVersion.create(:id => 6, :name => '5th')
IidxVersion.create(:id => 7, :name => '6th')
IidxVersion.create(:id => 8, :name => '7th')
IidxVersion.create(:id => 9, :name => '8th')
IidxVersion.create(:id => 10, :name => '9th')
IidxVersion.create(:id => 11, :name => '10th')
IidxVersion.create(:id => 12, :name => '11 IIDXRED')
IidxVersion.create(:id => 13, :name => '12 HAPPYSKY')
IidxVersion.create(:id => 14, :name => '13 DistorteD')
IidxVersion.create(:id => 15, :name => '14 GOLD')
IidxVersion.create(:id => 16, :name => '15 DJTROOPERS')
IidxVersion.create(:id => 17, :name => '16 EMPRESS')
IidxVersion.create(:id => 18, :name => '17 SIRIUS')
IidxVersion.create(:id => 19, :name => '18 ResortAnthem')
IidxVersion.create(:id => 20, :name => '19 Lincle')
IidxVersion.create(:id => 21, :name => '20 tricoro')
IidxVersion.create(:id => 22, :name => '21 SPADA')
IidxVersion.create(:id => 23, :name => '22 PENDUAL')
IidxVersion.create(:id => 24, :name => '23 copula')
IidxVersion.create(:id => 25, :name => '24 SINOBUZ')
IidxVersion.create(:id => 26, :name => '25 CANNONBALLERS')
IidxVersion.create(:id => 27, :name => '26 Rootage')
IidxVersion.create(:id => 28, :name => '27 ')

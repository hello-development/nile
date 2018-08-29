# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# %w()は配列を作る記法です　find_or_create_byは一件ずつデータを参照して無い場合はデータを作成します

label_name = %w(
  エイベックス
  ソニーミュージック
  ポニーキャニオン
  テレビ朝日ミュージック
  ユニバーサルミュージック
  ワーナーミュージックジャパン
)
  # その他
# )
label_name.each do |ln|
  Label.find_or_create_by(label_name: ln)
end

genre_name = %w(
  J-POP
  洋楽
  レゲエ
  ロック
  トランス
  アニメソング
  EDM
  演歌
)
genre_name.each do |gn|
  Genre.find_or_create_by(genre_name: gn)
end

#----- ArtistとItemのimage_idは各自のrefileで指定されたIDを入れるか""で指定して下さい(""で指定する時は各モデルのimageのvalidatesを外して下さい)。-----
#----- そうしなければこのままコメントアウト外すとエラーになると思います。-------------------------------------------------------------------------

# Artist.create( artist_name: "安室奈美恵", artist_contents: "日本・沖縄県出身。10代でグループとしてアーティストデビュー、瞬く間に数々のヒット曲を生み出し日本の音楽史に名前を刻む。1995年には早くもソロデビューし、ファーストシングルが70万枚、ファーストアルバムはミリオンセラー。",
#                artist_image_id: "9e4b1e36b7e565ec9f1a1d1f8790d21cc240d4b1e8acd31c8aeb72f101c6", label_id: "1", genre_id: "1")
# Artist.create( artist_name: "欅坂46", artist_contents: "秋元康総合プロデュース。乃木坂46に続く「坂道シリーズ」第2弾グループとして、応募者2万2509名のオーディションを経て2015年8月に誕生。2016年4月6日、1stシングル「サイレントマジョリティー」でデビュー。女性アーティストオリコン初週売上の歴代1位を獲得。",
#                artist_image_id: "0b087cb6359e042b6d5d5361ef6c5f7e9314b0313f2476df526ef59397d1", label_id: "2", genre_id: "1")
# Artist.create( artist_name: "米津玄師", artist_contents: "2009年より、”ハチ”名義でニコニコ動画へオリジナル曲を投稿し始め、2012年には、本名の “米津玄師” 名義で、自身がボーカルをとったアルバム『diorama』をリリース。 その独特なサウンドメイクをした楽曲の強さと、リアルな言葉の数々は圧倒的。",
#                artist_image_id: "158a19d8fd355367c26a1ec12e9b681c0f9d637c9c1bd9fe212b18709c5c", label_id: "2", genre_id: "1")
# Artist.create( artist_name: "藤あや子", artist_contents: "1987年、CBSソニーから村勢真奈美の芸名で、「ふたり川」（作詞: 石本美由起、作曲:船村徹）でテビュー。1989年9月21日、藤あや子に芸名を変え、「おんな」（作詞: 荒川利夫、作曲: 叶弦大）で再デビュー。1992年、「こころ酒」が大ヒットし、第25回日本有線大賞を受賞。また同年の第43回NHK紅白歌合戦に初出場を果たす。",
#                artist_image_id: "423de8023414df3c135883fbaaf055d028d3478dbb708cf3f3b044984b58", label_id: "2", genre_id: "8")
# Artist.create( artist_name: "A.B.C-Z", artist_contents: "橋本良亮、戸塚祥太、河合郁人、五関晃一、塚田僚一の5人で構成。前身となるグループ「A.B.C」に2008年橋本が加入し現在のグループ名に。「A.B.C」は「Acrobat Boys Club」の略で、アクロバティックなパフォーマンスや華麗なダンスを得意とする個性派ユニット。",
#                artist_image_id: "e320a9d9d9ceb1345b3d115152ea03cd1d73d9aa059605867bed399fa97f", label_id: "3", genre_id: "1")
# Artist.create( artist_name: "ケツメイシ", artist_contents: "1993年、RYOが通う大学の仲間が中心となってケツメイシの母体が誕生。1996年頃に現メンバーのRYO(MC)、RYOJI(Vo)、大蔵(MC)、DJ KOHNO(DJ)で結成される。2001年4月、「ファミリア」でメジャーデビューしてからは中毒性の高いナンバーを連発。2005年2月に発表した「さくら」は初のシングルチャート1位を獲得。同曲を含むアルバム『ケツノポリス４』は国民的ヒットを記録し、ケツメイシの人気を不動のものにした。",
#                artist_image_id: "1ac01085a9a3d83d7032c9530fb1d7dcb1bfa9aa6a9919d6e35c41d99c5e", label_id: "4", genre_id: "1")
# Artist.create( artist_name: "MINMI", artist_contents: "大阪府出身。幼少からピアノを弾き始め、1996年頃から大阪のレゲエやHIPHOPのクラブで歌い始める。2002年に1stシングル「The Perfect Vision」が売り上げ50万枚という快挙。自身が主催する大型野外フェス「FREEDOM」は人気の夏の野外フェスの1つとなっている。",
#                artist_image_id: "8ca7b0309bc61b9e61d289a5cbb0dbb6bc9582c56fdbfa4a698a91a11ebb", label_id: "5", genre_id: "3")
# Artist.create( artist_name: "back number", artist_contents: "Ba.Cho.小島 和也、Vo.Gu.清水 依与吏、Dr.栗原 寿。2004年、群馬にて清水依与吏を中心に結成。幾度かのメンバーチェンジを経て、2007年現在のメンバーとなる。2013年1～3月「back to the blues tour 2013」（ライブハウス&ホール全国17か所19公演）開催。6月 8thシングル『高嶺の花子さん』リリース。9月 初の日本武道館公演「live at 日本武道館-stay with us-」開催。",
#                artist_image_id: "0308b14be46310f11f6549ece5c3fab46278ced458636f312a952d521789", label_id: "5", genre_id: "4")
# Artist.create( artist_name: "Troye Sivan", artist_contents: "アフリカ出身、オーストラリア育ちのシンガー・ソングライター。子供の頃は俳優として活躍し、『ウルヴァリン: X-MEN ZERO』(2009)ではヒュー・ジャックマン演じる主人公の幼少期を演じた。2014年1st EP「TRXYE」リリース、66か国のiTunesで1位、全米ビルボード・アルバム・チャート5位、TIME誌の“2014年最も影響力のあるティーン”の一人に選ばれる。",
#                artist_image_id: "7675f8b2e80e117a85c5b6c11f5dcbb0a92406a1abb7e92097c4b16e6c0b", label_id: "5", genre_id: "2")
# Artist.create( artist_name: "[ALEXANDROS]", artist_contents: "2007年、ボーカルの川上洋平とベースの磯部寛之を中心に始動。しばらくして、ギターの白井眞輝とドラムの庄村聡泰が加入。2015年ユニバーサル ミュージックとグローバル契約を結び、2015年3月18日に映画・深夜ドラマのタイアップを含む、W両A面シングル「ワタリドリ/Dracula La」をリリース。",
#                artist_image_id: "2decbde94088743ebed16eba9995c7e0895bcfc151a3b12a8d6fca6fb0c7", label_id: "5", genre_id: "4")
# Artist.create( artist_name: "コブクロ", artist_contents: "インディーズ時代から幅広い世代の支持を集め、2001年、ワーナーミュージック・ジャパンより「YELL～エール／Bell」でメジャーデビュー。2005年、日本テレビ系ドラマ「瑠璃の島」の主題歌として発売された「ここにしか咲かない花」、同年11月に発売した「桜」が共に大ヒットを記録。年末のNHK紅白歌合戦にも初出場を果たした。",
#                artist_image_id: "69c6f9bdfecebfe26f8c054587e8b405f0246f136681125c15c2347f2338", label_id: "6", genre_id: "1")
# Artist.create( artist_name: "Dekel", artist_contents: "DEKEL（ディケル）は、2017年から個人での活動を始めた期待の新人アーティスト。",
#                artist_image_id: "b3d67dd8d94a927a7da5f566b48de0997e7f1ba4a95323ac9a06f70c3f48", label_id: "7", genre_id: "5")
# Artist.create( artist_name: "David Guetta", artist_contents: "ピエール・ダビド・ゲッタは、フランス・パリ出身のDJ、音楽プロデューサーである。デヴィッド・ゲッタは日本での英語風表記であり、フランス人としての名前ではダヴィッド。",
#                artist_image_id: "599e5143937600dbbcb8064bc18d7c342e9f397665f5779695b1f9d4585f", label_id: "7", genre_id: "6")


# Item.create( item_name: "Finally", item_contents: "引退が決まった彼女の25年間の歴史を辿るベスト・アルバム。",
#              artist_id: "1", label_id: "1", genre_id: "1", price: "3500", inventory: "0", item_image_id: "fa017551c2a9d2d59071c803bb3d28620f773ef580786926e3207c69c899" )
# Item.create( item_name: "CAN YOU CELEBRATE?", item_contents: "説明不要のウェディングソング!フジテレビ系連続ドラマ『バージンロード』の主題歌として話題に。",
#              artist_id: "1", label_id: "1", genre_id: "1", price: "1500", inventory: "1",item_image_id: "4b7c783297518f0957721188ac434e7a2eb96a88e62198e1ed555b842dd2")
# Item.create( item_name: "アンビバレント", item_contents: "勢いに乗る彼女たちの7thシングル。CD+DVD、｢全国握手会イベント参加券orスペシャルプレゼント応募券｣1枚封入、｢メンバー生写真｣ランダム1枚封入(TYPE別38種)",
#              artist_id: "2", label_id: "2", genre_id: "1", price: "1528", inventory: "46", item_image_id: "34f5cd8f751955d7b2cc7240b313cad4936583397d7ab67bcdcc2063f3f3")
# Item.create( item_name: "不協和音", item_contents: "歌詞は「軍門に下るのか」「君はYesと言うのか」などの問いかける詞が曲の旋律に乗り、複数の人物が議論を交わしているような仕上がりになっている。「僕は嫌だ」という台詞も特徴である。",
#              artist_id: "2", label_id: "2", genre_id: "1", price: "1528", inventory: "46", item_image_id: "00f81e34cda0760b295515ef8d9ba8bfb56012aa71a32ec544e53072bdcd")
# Item.create( item_name: "Lemon", item_contents: "石原さとみ主演、野木亜紀子脚本のTBS金曜ドラマ「アンナチュラル」の主題歌として書き下ろした楽曲。",
#              artist_id: "3", label_id: "2", genre_id: "1", price: "1200", inventory: "5",item_image_id: "9e6dec03732c24b92baf4f509e22515a1846ad3a10fe34822c0e08393fa4")
# Item.create( item_name: "LOSER / ナンバーナイン", item_contents: "Honda「JADE」のCMソング。カップリング曲「ナンバーナイン」はルーヴル美術館特別展「ルーヴルNo.9 ～漫画、9番目の芸術～」公式イメージソングとして制作された。",
#              artist_id: "3", label_id: "2", genre_id: "1", price: "1200", inventory: "5",item_image_id: "a214530f1ef1dffcec7c4220bf4cfb9385c04bb66645bb9d558bc940c192")
# Item.create( item_name: "素肌 / 素顔", item_contents: "藤あや子歌手生活30周年記念曲第三弾！アーティスト、作家として今最も注目の中村中との初タッグとなる。",
#              artist_id: "4", label_id: "2", genre_id: "8", price: "1204", inventory: "10",item_image_id: "57b141f61bf86bad80e1db239928b74749aec5d9894b1027c0fd72f2b364")
# Item.create( item_name: "JOYしたいキモチ", item_contents: "悩んだり、落ち込んだりしても「今しか出来ないこと 楽しんでこうよ！」と底抜けなポジティブメッセージが込められた楽曲となっており、聴けば“キモチ”が“JOY”すること間違いなし！ ",
#              artist_id: "5", label_id: "3", genre_id: "1", price: "1100", inventory: "15",item_image_id: "5d4bed8cd61aeb49d376f82e05a0b6779de9320fdbe7f0f973aa2154351e")
# Item.create( item_name: "終電を超えて〜Christmas Night/忘年会！BOU！NEN！KAI！", item_contents: "「クリスマス」/「忘年会」という年末の大イベントをコンセプトにした初の両A面CDシングル。",
#              artist_id: "5", label_id: "3", genre_id: "1", price: "1100", inventory: "15",item_image_id: "1b440397d69e8e5466a4fb96574b9c107845d6c1f5dce18e4574656dc30a")
# Item.create( item_name: "夏のプリンス／風は吹いている", item_contents: "プリンスホテル2018 Do!夏プリCMソング。カップリング曲「風が吹いている」はTVアニメ「深夜!天才バカボン」エンディングテーマ。",
#              artist_id: "6", label_id: "4", genre_id: "1", price: "1000", inventory: "20",item_image_id: "378d4da9d3dbd47cb0552f34ef4ff3b17068f6767c0c03372b70bb704827")
# Item.create( item_name: "シャナナ☆", item_contents: "アジア感が出ておりノれる曲。作詞作曲ともにMINMI。",
#              artist_id: "7", label_id: "5", genre_id: "3", price: "1200", inventory: "0",item_image_id: "c4fcacea25780440c79285693103c1d3804511d22cd0146cf1f8fa7c3e79")
# Item.create( item_name: "サマータイム!!", item_contents: "夏にぴったりのアッパーチューン！",
#              artist_id: "7", label_id: "5", genre_id: "3", price: "1200", inventory: "0",item_image_id: "75a15a803df2ec20e857c45f82260e1c8d53825ff3b61a5533ee94b2d922")
# Item.create( item_name: "大不正解", item_contents: "映画「銀魂2 掟は破るためにこそある」主題歌。",
#              artist_id: "8", label_id: "5", genre_id: "6", price: "1000", inventory: "5",item_image_id: "2c38dd41431880922fcba88aac9d9e90b80b69c951274b9d85cc14b6d941")
# Item.create( item_name: "高嶺の花子さん", item_contents: "蔦谷好位置をプロデューサーに迎えてのアップ･チューンを収録。",
#              artist_id: "8", label_id: "5", genre_id: "4", price: "1500", inventory: "10",item_image_id: "feb5a4eb585b9e501c0669b5b877017989b544f155b6150da53dbb89f082")
# Item.create( item_name: "ブルーム", item_contents: "才能と若さと美しさに満ち溢れたシンガー・ソングライター、トロイ・シヴァンの満を持しての日本デビュー盤。",
#              artist_id: "9", label_id: "5", genre_id: "2", price: "2200", inventory: "15",item_image_id: "6f418851ba618ad54684b131404becef613bacf03c442aa87ad4670a964b")
# Item.create( item_name: "ワタリドリ/Dracula La", item_contents: "ショウゲート配給映画『明烏』主題歌。カップリング曲「Dracula La」はMBS・TBS系ドラマ『女くどき飯』主題歌。",
#              artist_id: "10", label_id: "5", genre_id: "4", price: "1200", inventory: "20",item_image_id: "8ed07ef059b25becbfb0e7d6df33bfc0b80c0d980c872c02d73ac29e8e56")
# Item.create( item_name: "Mosquito Bite", item_contents: "福士蒼太主演の映画『BLEACH』の主題歌。",
#              artist_id: "10", label_id: "5", genre_id: "4", price: "1200", inventory: "20",item_image_id: "48c92f77f5cce160585eecb34f59392767e7cc838b2250d8507b5265e6d2")
# Item.create( item_name: "ONE TIMES ONE", item_contents: "ONE TIMES ONE:アサヒもぎたてCMソング、バトン:小野薬品300周年TV-CMイメージソング、君になれ:漫画『君になれ』（作：高野苺）コラボソング",
#              artist_id: "11", label_id: "6", genre_id: "1", price: "1204", inventory: "0",item_image_id: "6a40561a4ecad063550090deb79ad8ae580a0b2ecbfcb2c38a625762f1a4")
# Item.create!( item_name: "Technoaid", item_contents: "控えめなビルドアップから確実にアゲてくる。",
#              artist_id: "12", label_id: "7", genre_id: "5", price: "500", inventory: "5",item_image_id: "46cc393f4aa4aabf1420dfb2cec3d561f9ebe681b24e331a10b05fa7d853")
# Item.create( item_name: "Twister", item_contents: "ベースラインと強烈ビートに、蛇行するメロディーラインがついてくる。シンバルの挿入位置も、やはり絶妙",
#              artist_id: "12", label_id: "7", genre_id: "5", price: "500", inventory: "5",item_image_id: "1964b6993810f843a467a7fcfc87cf24128b118d8a778bfaa1ea2448a4c7")
# Item.create( item_name: "David Guetta ft Justin Bieber - 2U", item_contents: "「I'm the One」と「Despacito」に続く3番目のJustin Bieberとの共同シングル。",
#              artist_id: "13", label_id: "7", genre_id: "6", price: "500", inventory: "10",item_image_id: "89c4ed658faff3dc006766f0eb5aff7c11177c91516d780c4d41dd63f594")

Admin.create!(email: "admin@email.com", password: "adminpassword")

# 5.times do |i|
#   User.create( email: "otameshi#{i}@email.com", password: "otameshi", last_name: "お試し", first_name: "太郎#{i}",
#                last_name_kana: "オタメシ", first_name_kana: "タロウ#{i}", phone_number: "12312341234")
# end

# Address.create( postal_code: "1500041", address: "東京都渋谷区神南1−１９−１１ パークウェースクエア２",
#                 address_name: "お試し太郎0ＷＣＰ", user_id: "1" )
# Address.create( postal_code: "1500041", address: "東京都渋谷区神南1−１９−１１ パークウェースクエア２",
#                 address_name: "株式会社インフラトップ", user_id: "1" )
# Address.create( postal_code: "1500041", address: "東京都渋谷区神南1−１９−１１ パークウェースクエア２",
#                 address_name: "お試し太郎1ＷＣＰ", user_id: "2" )
# Address.create( postal_code: "1500041", address: "東京都渋谷区神南1−１９−１１ パークウェースクエア２",
#                 address_name: "お試し太郎2ＷＣＰ", user_id: "3" )
# Address.create( postal_code: "1500041", address: "東京都渋谷区神南1−１９−１１ パークウェースクエア２",
#                 address_name: "お試し太郎3ＷＣＰ", user_id: "4" )
# Address.create( postal_code: "1500041", address: "東京都渋谷区神南1−１９−１１ パークウェースクエア２",
#                 address_name: "お試し太郎4ＷＣＰ", user_id: "5" )





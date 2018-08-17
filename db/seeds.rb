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

Admin.create!(email: "admin@email.com")
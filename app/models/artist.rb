class Artist < ApplicationRecord
	acts_as_paranoid

	default_scope -> { order(created_at: :desc) }

	has_many :items, dependent: :destroy
	has_many :users

	attachment :artist_image

	validates :artist_name, presence: true
	validates :artist_image, presence: true
	validates :artist_contents, length: { maximum:300 }

	# 絞り込み検索時に使用するデータ（seedに入っているIDと内容を同じにすると使えるっぽい）
	enum genre: { JｰPOP: 1, 洋楽: 2, レゲエ: 3, ロック: 4, トランス: 5, アニメソング: 6, EDM: 7, 演歌: 8 }
	enum label: { エイベックス: 1, ソニーミュージック: 2, ポニーキャニオン: 3, テレビ朝日ミュージック: 4, ユニバーサルミュージック: 5, ワーナーミュージックジャパン: 6 }

	# スコープでセレクトタグによって指定したIDをもとにwhereで絞り込みしてるみたいです。。
	scope :get_by_genre_id, ->(genre_id) { where(genre_id: genre_id) }
	scope :get_by_label_id, ->(label_id) { where(label_id: label_id) }

	scope :get_by_artist_name, ->(artist_name) { where("artist_name like ?", "%#{artist_name}%") }

end

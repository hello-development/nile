class Item < ApplicationRecord
	acts_as_paranoid

	belongs_to :artist
	belongs_to :label
	belongs_to :genre
	has_many :disks, dependent: :destroy
	has_many :purchase_datails
	has_many :cart_items
	has_many :likes, dependent: :destroy
	has_many :reviews, dependent: :destroy

	validates :artist_id, presence: true
	validates :label_id, presence: true
	validates :genre_id, presence: true
	validates :item_image, presence: true
	validates :item_name, presence: true
	validates :item_contents, presence: true
	validates :price, numericality: { only_integer: true }
	validates :inventory, numericality: { only_integer: true }

	# validates :disk_number, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	# validates :price, numericality: { only_integer: true }


	attachment :item_image

	# 絞り込み検索時に使用するデータ（seedに入っているIDと内容を同じにすると使えるっぽい）
	enum genre: { JｰPOP: 1, 洋楽: 2, レゲエ: 3, ロック: 4, トランス: 5, アニメソング: 6, EDM: 7, 演歌: 8 }
	enum label: { エイベックス: 1, ソニーミュージック: 2, ポニーキャニオン: 3, テレビ朝日ミュージック: 4, ユニバーサルミュージック: 5, ワーナーミュージックジャパン: 6 }

	# スコープでセレクトタグによって指定したIDをもとにwhereで絞り込みしてるみたいです。。
	scope :get_by_genre_id, ->(genre_id) { where(genre_id: genre_id) }
	scope :get_by_label_id, ->(label_id) { where(label_id: label_id) }

	# 名による絞り込み
	scope :get_by_item_name, ->(item_name) { where("item_name like ?", "%#{item_name}%") }
	# 性別による絞り込み
	# scope :get_by_gender, ->(gender) { where(gender: gender) }

	def favorited_by?(user)
          likes.where(user_id: user.id).exists?
    end

end

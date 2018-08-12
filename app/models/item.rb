class Item < ApplicationRecord
	belongs_to :artist
	belongs_to :label
	belongs_to :genre
	has_many :disks, dependent: :destroy
	has_many :purchase_datails
	has_many :cart_items
	has_many :likes, dependent: :destroy
	has_many :reviews, dependent: :destroy

	validates :artist, presence: true
	validates :label, presence: true
	validates :genre, presence: true

	attachment :item_image

end

class Artist < ApplicationRecord

	has_many :items, dependent: :destroy
	has_many :users

	attachment :artist_image

	validates :artist_name, presence: true
	validates :artist_image, presence: true
	validates :artist_contents, length: { maximum:300 }
end

class Artist < ApplicationRecord

	has_many :items, dependent: :destroy
	has_many :users

	attachment :artist_image
end

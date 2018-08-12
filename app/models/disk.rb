class Disk < ApplicationRecord

	belongs_to :item
	has_many :songs, dependent: :destroy
end

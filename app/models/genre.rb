class Genre < ApplicationRecord

	has_many :items
	has_many :artists

	# validates :item, presence: true
end
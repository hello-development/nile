class Label < ApplicationRecord
	has_many :items

	# validates :item,  presence: true

end

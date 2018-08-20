class Review < ApplicationRecord
	belongs_to :user
	belongs_to :item

	# validates :user :item, presence: true

end

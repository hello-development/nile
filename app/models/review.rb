class Review < ApplicationRecord
	belongs_to :user
	belongs_to :item

	validates :comment, length: { in: 1..100 }
	 
	# validates :user :item, presence: true

end

class Like < ApplicationRecord
	belongs_to :user
	belongs_to :item

	# validates :user, :item, presence: true
	# default_scope -> { order(created_at: :desc) }

end

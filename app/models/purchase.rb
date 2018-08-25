class Purchase < ApplicationRecord

	belongs_to :user
	has_many :purchase_datails, dependent: :destroy

	default_scope -> { order(purchased_date: :desc) }

end

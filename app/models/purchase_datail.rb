class PurchaseDatail < ApplicationRecord
	belongs_to :item
	belongs_to :purchase

	validates :purchase,  presence: true

end

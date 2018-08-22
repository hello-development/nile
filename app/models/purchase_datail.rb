class PurchaseDatail < ApplicationRecord
	belongs_to :item
	belongs_to :purchase

	validates :purchase_id,  presence: true

end

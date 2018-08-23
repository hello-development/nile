class PurchaseDatail < ApplicationRecord
	belongs_to :item
	belongs_to :purchase, optional: true

	validates :purchase_id,  presence: true

end

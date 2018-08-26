class PurchaseDatail < ApplicationRecord
    acts_as_paranoid #論理削除用

	belongs_to :item
	belongs_to :purchase, optional: true

	validates :purchase_id,  presence: true

end

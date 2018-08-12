class CartItem < ApplicationRecord

	belongs_to :cart
	belongs_to :item

	validates :cart, presence: true
end

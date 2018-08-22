class CartItem < ApplicationRecord

	belongs_to :cart
	belongs_to :item

	validates :cart, presence: true
	validates :units, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end

class Purchase < ApplicationRecord

	belongs_to :user
	has_many :purchase_datails, dependent: :destroy

	validates :purchase,  presence: true

end

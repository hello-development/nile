class Purchase < ApplicationRecord
	acts_as_paranoid #論理削除用

	belongs_to :user
	has_many :purchase_datails, dependent: :destroy

	default_scope -> { order(purchased_date: :desc) }

	validates :user_id,  presence: true

end

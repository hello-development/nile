class Purchase < ApplicationRecord
	acts_as_paranoid #論理削除用

	belongs_to :user
	has_many :purchase_datails, dependent: :destroy

	default_scope -> { order(purchased_date: :desc) }

	validates :user_id,  presence: true
	validates :status, presence: true
	enum status: { 受付: 0, 商品準備中: 1, 出荷済: 2 }

end

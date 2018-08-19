class Disk < ApplicationRecord
	acts_as_paranoid

	belongs_to :item
	has_many :songs, dependent: :destroy

	validates :disk_number, presence: true
	validates :disk_number, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates :item_id, presence:true

	default_scope -> { order(disk_number: :asc) }

end

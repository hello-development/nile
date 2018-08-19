class Disk < ApplicationRecord
	acts_as_paranoid

	belongs_to :item
	has_many :songs, dependent: :destroy

	validates_presence_of :disk_number
	validates_presence_of :item_id
end

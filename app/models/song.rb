class Song < ApplicationRecord
	belongs_to :disk

	validates :item,  presence: true

end

class Song < ApplicationRecord
	belongs_to :disk

	validates :song_order,  presence: true
	validates :song_name,  presence: true

end

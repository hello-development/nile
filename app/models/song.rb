class Song < ApplicationRecord
	acts_as_paranoid

	belongs_to :disk

	validates :song_order,  presence: true
	validates :song_order, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates :song_name,  presence: true

    default_scope -> { order(song_order: :asc) }

end

class Address < ApplicationRecord

	belongs_to :user

	validates :user, presence: true
	validates :postal_code, length: { minimum: 7, maximum: 7 }
end

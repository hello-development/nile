class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :reviews, dependent: :destroy
   has_many :likes, dependent: :destroy
   has_one :cart, dependent: :destroy
   has_many :addresses, dependent: :destroy
   belongs_to :artist
   belongs_to :purchase

end

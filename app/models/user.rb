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

    validates :last_name,
    presence: true

    validates :first_name,
    presence: true

    validates :last_name_kana,
    presence: true

    validates :first_name_kana,
    presence: true

    validates :phone_number,
    presence: true

    validates :email,
    presence: true

    validates :password,
    presence: true,
    uniqueness: true,
    length: { minimum: 6 },
    format: { with: /\A[a-z0-9]+\z/i }

end

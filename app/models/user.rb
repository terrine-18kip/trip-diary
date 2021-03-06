class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :name, presence: true
  validates :password, format: { with: PASSWORD_REGEX }

  has_one_attached :image
  has_many         :trip_users, dependent: :destroy
  has_many         :trips, through: :trip_users
end

class Trip < ApplicationRecord
  validates :title, presence: true

  has_many :trip_users
  has_many :users, through: :trip_users, validate: false
  has_many :plans
end

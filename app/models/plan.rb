class Plan < ApplicationRecord
  validates :daily, presence: true, numericality: { only_integer: true }

  belongs_to :trip
  has_many   :spots, -> { order(position: :asc) }, dependent: :destroy 
end

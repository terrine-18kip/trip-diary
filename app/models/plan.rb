class Plan < ApplicationRecord
  validates :daily, presence: true

  belongs_to :trip
  has_many   :spots, dependent: :destroy
end

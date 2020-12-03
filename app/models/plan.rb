class Plan < ApplicationRecord
  validates :daily, presence: true

  belongs_to :trip
end

class Plan < ApplicationRecord
  validates :day_id, presence: true

  belongs_to :trip
end

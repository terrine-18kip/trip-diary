class Spot < ApplicationRecord
  validates :name,        presence: true
  validates :category_id, presence: true
  validates :fee,         allow_blank: true, numericality: { only_integer: true }

  belongs_to :plan

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end

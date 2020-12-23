class Spot < ApplicationRecord
  validates :name,        presence: true
  validates :category_id, presence: true
  validates :fee,         allow_blank: true, numericality: { only_integer: true }

  belongs_to :plan
  belongs_to :trip
  acts_as_list scope: :plan

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  def self.sum_fee(plans)
    fee = 0
    plans.each do |plan|
      fee += plan.spots.sum(:fee)
    end
    fee
  end
end

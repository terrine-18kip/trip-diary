require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe '#create' do
    before do
      @plan = FactoryBot.build(:plan)
    end

    it 'すべての情報が存在すれば登録できること' do
      expect(@plan).to be_valid
    end

    it 'dailyが空では登録できないこと' do
      @plan.daily = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Daily can't be blank")
    end

    it 'dailyがinteger以外では登録できないこと' do
      @plan.daily = "１"
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Daily is not a number")
    end

    it 'tripが紐ついていないと登録できないこと' do
      @plan.trip = nil
      @plan.valid?
      expect(@plan.errors.full_messages).to include("Trip must exist")
    end
  end
end

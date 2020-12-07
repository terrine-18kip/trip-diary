require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe '#create' do
    before do
      @spot = FactoryBot.build(:spot)
    end

    it 'すべての情報が存在すれば登録できること' do
      expect(@spot).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @spot.name = nil
      @spot.valid?
      expect(@spot.errors.full_messages).to include("Name can't be blank")
    end

    it 'category_idが空では登録できないこと' do
      @spot.category_id = nil
      @spot.valid?
      expect(@spot.errors.full_messages).to include("Category can't be blank")
    end

    it 'start_timeが空でも登録できること' do
      @spot.start_time = nil
      expect(@spot).to be_valid
    end

    it 'end_timeがでも登録できること' do
      @spot.end_time = nil
      expect(@spot).to be_valid
    end

    it 'feeが空でも登録できること' do
      @spot.fee = nil
      expect(@spot).to be_valid
    end

    it 'feeがinteger以外では登録できないこと' do
      @spot.fee = "１"
      @spot.valid?
      expect(@spot.errors.full_messages).to include("Fee is not a number")
    end

    it 'linkが空でも登録できること' do
      @spot.link = nil
      expect(@spot).to be_valid
    end

    it 'memoが空でも登録できること' do
      @spot.memo = nil
      expect(@spot).to be_valid
    end

    it 'planが紐ついていないと登録できないこと' do
      @spot.plan = nil
      @spot.valid?
      expect(@spot.errors.full_messages).to include("Plan must exist")
    end
  end
end

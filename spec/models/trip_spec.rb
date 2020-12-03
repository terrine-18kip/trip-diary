require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe '#create' do
    before do
      @trip = FactoryBot.build(:trip)
    end

    it 'すべての情報が存在すれば登録できること' do
      expect(@trip).to be_valid
    end

    it 'titleが空では登録できないこと' do
      @trip.title = nil
      @trip.valid?
      expect(@trip.errors.full_messages).to include("Title can't be blank")
    end

    it 'start_dateが空でも登録できること' do
      @trip.start_date = nil
      expect(@trip).to be_valid
    end

    it 'end_dateがでも登録できること' do
      @trip.end_date = nil
      expect(@trip).to be_valid
    end

    it 'memoが空でも登録できること' do
      @trip.memo = nil
      expect(@trip).to be_valid
    end
  end
end

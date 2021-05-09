require 'rails_helper'

RSpec.describe Client, type: :model do
  before do
    @client = FactoryBot.build(:client)
  end

  describe '顧客追加' do
    context '顧客追加できるとき' do
      it '全てが正しく入力されていれば追加できる' do
        binding.pry
        expect(@client).to be_valid
      end

      it 'birthdayが空でも追加できる' do
        @client.birthday = ''
        expect(@client).to be_valid
      end

      it 'prefectureが0でも追加できる' do
        @client.prefecture_id = 0
        expect(@client).to be_valid
      end

      it 'fromが0でも追加できる' do
        @client.from_id = 0
        expect(@client).to be_valid
      end

      it 'corporationが空でも追加できる' do
        @client.corporation = ''
        expect(@client).to be_valid
      end

      it 'drinkが空でも追加できる' do
        @client.drink = ''
        expect(@client).to be_valid
      end

      it 'foodが空でも追加できる' do
        @client.food = ''
        expect(@client).to be_valid
      end

      it 'cigarettesが空でも追加できる' do
        @client.cigarettes = ''
        expect(@client).to be_valid
      end

      it 'memoが空でも追加できる' do
        @client.memo = ''
        expect(@client).to be_valid
      end
    end

    context '顧客追加できないとき' do
      it 'nameが空では保存できない' do
        @client.name = ''
        @client.valid?
        expect(@client.errors.full_messages).to include("Name can't be blank")
      end

      it 'name_hiraganaが空では保存できない' do
        @client.name_hiragana = ''
        @client.valid?
        expect(@client.errors.full_messages).to include("Name hiragana can't be blank")
      end

      it 'userが紐づいていないと保存できない' do
        @client.user = nil
        @client.valid?
        expect(@client.errors.full_messages).to include('User must exist')
      end
    end
  end
end

# bundle exec rspec spec/models/client_spec.rb
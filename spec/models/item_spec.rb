require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '正常系' do
      it '各項目が正しい形式で入力されていれば正常に処理されること' do
        expect(@item).to be_valid
      end
    end

    context '異常系' do
      it 'image の値が nil だと blank エラーが発生すること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.of_kind?(:image, :blank)).to be_truthy
      end
      it 'name の値が nil だと blank エラーが発生すること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.of_kind?(:name, :blank)).to be_truthy
      end
      it 'info の値が nil だと blank エラーが発生すること' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.of_kind?(:info, :blank)).to be_truthy
      end
      it 'category_id の値が nil だと blank エラーが発生すること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.of_kind?(:category_id, :blank)).to be_truthy
      end
      it 'sales_status_id の値が nil だと blank エラーが発生すること' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.of_kind?(:sales_status_id, :blank)).to be_truthy
      end
      it 'shipping_fee_status_id の値が nil だと blank エラーが発生すること' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.of_kind?(:shipping_fee_status_id, :blank)).to be_truthy
      end
      it 'prefecture_id の値が nil だと blank エラーが発生すること' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.of_kind?(:prefecture_id, :blank)).to be_truthy
      end
      it 'scheduled_delivery_id の値が nil だと blank エラーが発生すること' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.of_kind?(:scheduled_delivery_id, :blank)).to be_truthy
      end
      it 'price の値が nil だと blank エラーが発生すること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.of_kind?(:price, :blank)).to be_truthy
      end

      it 'category_id の値が 1 だと other_than エラーが発生すること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.of_kind?(:category_id, :other_than)).to be_truthy
      end
      it 'sales_status_id の値が 1 だと other_than エラーが発生すること' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.of_kind?(:sales_status_id, :other_than)).to be_truthy
      end
      it 'shipping_fee_status_id の値が 1 だと other_than エラーが発生すること' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.of_kind?(:shipping_fee_status_id, :other_than)).to be_truthy
      end
      it 'prefecture_id の値が 1 だと other_than エラーが発生すること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.of_kind?(:prefecture_id, :other_than)).to be_truthy
      end
      it 'scheduled_delivery_id の値が 1 だと other_than エラーが発生すること' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.of_kind?(:scheduled_delivery_id, :other_than)).to be_truthy
      end

      it 'user の値が nil だと blank エラーが発生すること' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.of_kind?(:user, :blank)).to be_truthy
      end
      it 'price の値が 299 だと greater_than_or_equal_to エラーが発生すること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.of_kind?(:price, :greater_than_or_equal_to)).to be_truthy
      end
      it 'price の値が 10000000 だと less_than_or_equal_to エラーが発生すること' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.of_kind?(:price, :less_than_or_equal_to)).to be_truthy
      end
    end
  end
end

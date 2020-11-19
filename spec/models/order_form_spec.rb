require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe '出品登録' do
    context '出品登録がうまくいくとき' do
      it '各項目が存在すれば登録できること' do
        expect(@order_form).to be_valid
      end
      it 'building_name は空でも登録できること' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
    end

    context '出品登録がうまくいかないとき' do
      it 'user_id が空では登録できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_id が空では登録できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'token が空では登録できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_code が空では登録できないこと' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_code が正しい形式でないと登録できないこと' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_id が空では登録できないこと' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_id が未選択では登録できないこと' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'city が空では登録できないこと' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it 'house_number が空では登録できないこと' do
        @order_form.house_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end

      it 'tel が空では登録できないこと' do
        @order_form.tel = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel can't be blank")
      end
      it 'tel に数字以外が含まれていると登録できないこと' do
        @order_form.tel = '090-123-456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel is invalid')
      end
      it 'tel が12桁以上だと登録できないこと' do
        @order_form.tel = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel is invalid')
      end
      it 'tel が9桁以下だと登録できないこと' do
        @order_form.tel = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel is invalid')
      end
      it 'tel の先頭が0以外だと登録できないこと' do
        @order_form.tel = '1234567890'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel is invalid')
      end
    end
  end
end

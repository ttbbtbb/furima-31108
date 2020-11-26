require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常系' do
      it '各項目が正しい形式で入力されていれば正常に処理されること' do
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      it 'nickname の値が nil だと blank エラーが発生すること' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.of_kind?(:nickname, :blank)).to be_truthy
      end
      it 'email の値が nil だと blank エラーが発生すること' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.of_kind?(:email, :blank)).to be_truthy
      end
      it 'password の値が nil だと blank エラーが発生すること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.of_kind?(:password, :blank)).to be_truthy
      end

      it 'password と password_confirmation が不一致では登録できないこと' do
        str = 'a12345'
        @user.password = str
        @user.password_confirmation = str + 'hoge'
        @user.valid?
        expect(@user.errors.of_kind?(:password_confirmation, :confirmation)).to be_truthy
      end

      it 'family_name の値が nil だと blank エラーが発生すること' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.of_kind?(:family_name, :blank)).to be_truthy
      end
      it 'given_name の値が nil だと blank エラーが発生すること' do
        @user.given_name = nil
        @user.valid?
        expect(@user.errors.of_kind?(:given_name, :blank)).to be_truthy
      end
      it 'family_name_kana の値が nil だと blank エラーが発生すること' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.of_kind?(:family_name_kana, :blank)).to be_truthy
      end
      it 'given_name_kana の値が nil だと blank エラーが発生すること' do
        @user.given_name_kana = nil
        @user.valid?
        expect(@user.errors.of_kind?(:given_name_kana, :blank)).to be_truthy
      end
      it 'birth_date の値が nil だと blank エラーが発生すること' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.of_kind?(:birth_date, :blank)).to be_truthy
      end

      it 'family_name の値が "ﾊﾝｶｸ" だと invalid エラーが発生すること' do
        @user.family_name = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.of_kind?(:family_name, :invalid)).to be_truthy
      end
      it 'given_name の値が "ﾊﾝｶｸ" だと invalid エラーが発生すること' do
        @user.given_name = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.of_kind?(:given_name, :invalid)).to be_truthy
      end
      it 'family_name_kana の値が "ﾊﾝｶｸ" だと invalid エラーが発生すること' do
        @user.family_name_kana = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.of_kind?(:family_name_kana, :invalid)).to be_truthy
      end
      it 'given_name_kana の値が "ﾊﾝｶｸ" だと invalid エラーが発生すること' do
        @user.given_name_kana = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.of_kind?(:given_name_kana, :invalid)).to be_truthy
      end

      it 'email の値に "@" が含まれないと invalid エラーが発生すること' do
        @user.email = "testatexample.com"
        @user.valid?
        expect(@user.errors.of_kind?(:email, :invalid)).to be_truthy
      end
      it 'email が重複して存在すると taken エラーが発生すること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.of_kind?(:email, :taken)).to be_truthy
      end
      it 'password が5文字以下 だと too_short エラーが発生すること' do
        str = 'a1234'
        @user.password = str
        @user.password_confirmation = str
        @user.valid?
        expect(@user.errors.of_kind?(:password, :too_short)).to be_truthy
      end
      it 'password が数字のみ だと invalid エラーが発生すること' do
        str = '123456'
        @user.password = str
        @user.password_confirmation = str
        @user.valid?
        expect(@user.errors.of_kind?(:password, :invalid)).to be_truthy
      end
      it 'password が英字のみ だと invalid エラーが発生すること' do
        str = 'abcdef'
        @user.password = str
        @user.password_confirmation = str
        @user.valid?
        expect(@user.errors.of_kind?(:password, :invalid)).to be_truthy
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '必要な情報をすべて入力しれいれば新規登録できる' do
      expect(@user).to be_valid
    end

    it 'nameが空だと新規登録できない' do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空だと新規登録できない' do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")      
    end

    it 'emailは登録済みのものと重複していると新規登録できないこと' do
      @user.save
      another = FactoryBot.build(:user)
      another.email = @user.email
      another.valid?
      expect(another.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailは@がついていないと新規登録できない' do
      @user.email = "aiueoaieuo.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空だと新規登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationが空だと新規登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが一致しないと新規登録できない' do
      @user.save
      @user.password_confirmation = "aiueoaiueo"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字未満だと新規登録できない' do
      @user.save
      @user.password = "aiu13"
      @user.password_confirmation = "aiu13"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが英数字込みでないと新規登録できない' do
      @user.save
      @user.password = "aiueoaiueo"
      @user.password_confirmation = "aiueoaiueo"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
  end
end

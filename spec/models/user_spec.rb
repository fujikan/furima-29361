require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it "nicknameとemail、passwordとpassword_confirmation、family_name、first_name、family_name_kana、first_name_kana、birth_dayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@が含まれていないと登録できないこと" do
      @user.email = "****furima.com"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが6文字以上であれば登録できないこと" do
      @user.password = "gnm01xyz"
      @user.password_confirmation = "gnm01xyz"
      expect(@user).to be_valid
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
    end

    it"family_nameが空では登録できないこと" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it"family_nameが全角でないと登録できないこと" do
      @user.family_name = "fuji"
      @user.valid?
      expect(@user.errors.full_messages).to  include("Family name は全角で入力してください。")
    end

    it"first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it"first_nameが全角でないと登録できないこと" do
      @user.first_name = "kan"
      @user.valid?
      expect(@user.errors.full_messages).to  include("First name は全角で入力してください。")
    end

    it"family_name_kanaが空では登録できないこと" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it"family_name_kanaがカタカナでないと登録できないこと" do
      @user.family_name_kana = "ふじ"
      @user.valid?
      expect(@user.errors.full_messages).to  include("Family name kana は全角で入力してください。")
      
    end

    it"first_name_kanaが空では登録できないこと" do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it"first_name_kanaがカタカナだと登録できること" do
    @user.first_name_kana = "かん"
    @user.valid?
    expect(@user.errors.full_messages).to  include("First name kana は全角で入力してください。")
    end

    it"birth_dayが空では登録できないこと" do
    @user.birth_day = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    
  end
end

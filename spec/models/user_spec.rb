require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a name, email" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nameが空では登録できないこと
    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 6. nameが9文字以上であれば登録できないこと
    it it "is invalid with a name that has more than 9 characters " do
      user = build(:user, name: "aaaaaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include("は8文字以内で入力してください")
    end

    # 7. nicknameが8文字以下では登録できること
    it "is valid with a name that has less than 8 characters " do
      user = build(:user, name: "aaaaaaaa")
      expect(user).to be_valid
    end

    # 8. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 9. passwordが8文字以上であれば登録できること
    it "is valid with a password that has more than 8 characters " do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user).to be_valid
    end

    # 10. passwordが7文字以下であれば登録できないこと
    it "is invalid with a password that has less than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end
  end
end
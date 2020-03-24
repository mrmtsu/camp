require 'rails_helper'

describe User do
  describe '#create' do
    it "is invalid without a name" do
      user = build(:user, name: "123456789")
      user.valid?
      expect(user.errors[:name]).to include("can't be blanck")
    end

    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blanck")
    end
  end
end
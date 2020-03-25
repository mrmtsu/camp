require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    context 'can save' do
      # 1. imageとtextが存在すれば投稿できること
      it "is valid with a image, text" do
        post = build(:post)
        expect(post).to be_valid
      end
    end

    context 'can not save' do
      # 2. imageが空では登録できないこと
      it "is invalid without a image" do
        post = build(:post, image: nil)
        post.valid?
        expect(post.errors[:image]).to include("を入力してください")
      end

      # 3. textが空では登録できないこと
      it "is invalid without a text" do
        post = build(:post, text: nil)
        post.valid?
        expect(post.errors[:text]).to include("を入力してください")
      end
    end

  end
end

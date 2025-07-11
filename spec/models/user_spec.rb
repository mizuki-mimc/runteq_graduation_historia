require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject { build(:user) }

    it '名前、メールアドレス、プロバイダー、UIDがあれば有効であること' do
      expect(subject).to be_valid
    end

    it '名前がなければ無効であること' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name]).to include("を入力してください")
    end

    it 'メールアドレスがなければ無効であること' do
      subject.email = nil
      subject.valid?
      expect(subject.errors[:email]).to include("を入力してください")
    end

    it '重複したメールアドレスは無効であること' do
      # 1人目のユーザーをデータベースに保存
      create(:user, email: 'test@example.com')
      # 2人目として、同じメールアドレスを持つユーザーを作成しようとする
      user2 = build(:user, email: 'test@example.com')
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")
    end
  end

  describe 'Associations' do
    it 'ユーザーが削除されたら、そのユーザーが持つストーリーも全て削除されること' do
      # 1. テスト用のユーザーと、そのユーザーに紐づくストーリーを2つ作成
      user = create(:user)
      create_list(:story, 2, user: user)

      # 2. ユーザーを削除した時に、Storyモデルの数が2つ減ることを確認
      expect { user.destroy }.to change(Story, :count).by(-2)
    end
  end
end

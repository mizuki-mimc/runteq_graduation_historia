require 'rails_helper'

RSpec.describe Story, type: :model do
  let(:user) { create(:user) }
  let(:story) { build(:story, user: user) }

  describe 'Validations' do
    context '必須項目について' do
      it 'タイトルとジャンルがあれば有効であること' do
        expect(story).to be_valid
      end

      it 'タイトルがなければ無効であること' do
        story.title = nil
        story.valid?
        expect(story.errors[:title]).to include("を入力してください")
      end

      it 'ジャンルがなければ無効であること' do
        story.genre = nil
        story.valid?
        expect(story.errors[:genre]).to include("を入力してください")
      end
    end

    context '文字数制限について' do
      it 'タイトルが100文字以内であれば有効であること' do
        story.title = 'a' * 100
        expect(story).to be_valid
      end

      it 'タイトルが101文字以上であれば無効であること' do
        story.title = 'a' * 101
        story.valid?
        expect(story.errors[:title]).to include("は100文字以内で入力してください")
      end

      it 'テーマが50文字以内であれば有効であること' do
        story.thema = 'a' * 50
        expect(story).to be_valid
      end

      it 'テーマが51文字以上であれば無効であること' do
        story.thema = 'a' * 51
        story.valid?
        expect(story.errors[:thema]).to include("は50文字以内で入力してください")
      end
    end
  end

  describe 'Associations' do
    it 'ストーリーが削除されたら、そのストーリーに紐づくプロットも全て削除されること' do
      # 1. テスト用のストーリーと、それに紐づくプロットを作成
      story_with_plot = create(:story)
      create(:plot, story: story_with_plot)

      # 2. ストーリーを削除した時に、Plotモデルの数が1減ることを確認
      expect { story_with_plot.destroy }.to change(Plot, :count).by(-1)
    end
  end
end

require 'rails_helper'

RSpec.describe "ストーリーのCRUD機能", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    driven_by(:selenium_chrome_headless)

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: user.uid,
      info: { name: user.name, email: user.email }
    })
  end

  it "ユーザーがストーリーの作成、閲覧、編集、削除を正常に行える" do
    visit root_path
    within(".action-buttons") do
      click_button "Googleでログイン"
    end
    expect(page).to have_current_path(stories_path)

    click_link "ストーリー作成"
    expect(page).to have_current_path(new_story_path)

    fill_in "タイトル", with: "テスト用の物語"
    fill_in "テーマ", with: "友情と冒険"
    select "ファンタジー", from: "ジャンル"

    click_button "ストーリーをはじめる！"

    expect(page).to have_content("ストーリーが作成されました！")
    expect(page).to have_content("テスト用の物語")

    expect(page).to have_content("友情と冒険")
    expect(page).to have_content("ファンタジー")

    click_link "ストーリーを編集する"

    fill_in "タイトル", with: "更新された物語"
    select "SF", from: "ジャンル"
    click_button "ストーリーを更新する"

    expect(page).to have_content("ストーリー「更新された物語」を更新しました。")
    expect(page).to have_content("SF")

    # 1. モーダルを開くためのリンクをクリック
    click_link "ストーリーを削除する"

    # 2. モーダル内に表示される、実際の削除ボタンをクリック
    click_button "削除する"

    expect(page).to have_content("ストーリー「更新された物語」を削除しました。")
    expect(page).to have_current_path(stories_path)
    expect(page).to have_content("まだストーリーはありません")
  end
end

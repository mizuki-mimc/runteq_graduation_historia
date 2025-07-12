require 'rails_helper'

RSpec.describe "ログインとログアウト", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "Googleでログインし、ログアウトできる" do
    visit root_path
    expect(page).to have_button("Googleでログイン")

    # ページ内中央のボタンをクリックすることを明確化
    within(".action-buttons") do
      click_button "Googleでログイン"
    end

    expect(page).to have_current_path(stories_path)
    # ヘッダー内のログアウトボタンであることを確認
    within("header") do
      expect(page).to have_content("ログアウト")
      click_button "ログアウト"
    end

    expect(page).to have_current_path(root_path)
    expect(page).to have_button("Googleでログイン")
  end
end

// Turboをインポートして起動します
import "@hotwired/turbo-rails"

// これで controllers/index.js が読み込まれ、
// 結果的にStimulusの初期化と全コントローラの登録が完了します。
// これ以外の記述はすべて不要です。
import "controllers"
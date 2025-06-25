import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // モーダル本体、タイトル、そして削除実行フォームをターゲットとして定義
  static targets = [ "container", "title", "form" ]

  // 削除リンクがクリックされた時に呼ばれる
  open(event) {
    // リンクのデフォルトの動き（ページ遷移）を止める
    event.preventDefault()

    // リンクのdata属性から、削除用のURLとタイトルを取得
    const deleteUrl = event.currentTarget.dataset.modalUrl
    const storyTitle = event.currentTarget.dataset.modalStoryTitle

    // モーダル内のタイトルと、フォームの送信先URLを動的に書き換える
    this.titleTarget.textContent = storyTitle
    this.formTarget.action = deleteUrl
    
    // モーダル本体を表示する
    this.containerTarget.classList.remove("hidden")
  }

  // キャンセルボタンか、背景がクリックされたときに呼ばれる
  close() {
    this.containerTarget.classList.add("hidden")
  }
}
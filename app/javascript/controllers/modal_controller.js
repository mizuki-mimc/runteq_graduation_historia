import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "container", "form", "modalTitle", "body", "submitButton" ]

  open(event) {
    event.preventDefault()
    
    const dataset = event.currentTarget.dataset

    const url = dataset.modalUrl
    const title = dataset.modalTitle || "確認"
    const body = dataset.modalBody || "この操作を続けてもよろしいですか？"
    const buttonText = dataset.modalButtonText || "実行する"

    this.formTarget.action = url
    this.modalTitleTarget.textContent = title
    this.bodyTarget.innerHTML = body
    this.submitButtonTarget.value = buttonText
    this.containerTarget.classList.remove("hidden")
  }

  close() {
    this.containerTarget.classList.add("hidden")
  }
}

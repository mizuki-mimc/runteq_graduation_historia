import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select", "container", "template", "name", "value", "flashContainer"]

  static values = {
    duplicateMessage: { type: String, default: "すでに追加されています。この項目は複数追加できません。" }
  }

  add(event) {
    event.preventDefault()
    const selectedOption = this.selectTarget.selectedOptions[0]
    const selectedValue = selectedOption.value
    const selectedName = selectedOption.dataset.name

    if (!selectedValue) return

    if (this.containerTarget.querySelector(`input[value="${selectedValue}"]`)) {
      this.showFlash(this.duplicateMessageValue)
      return
    }

    this.flashContainerTarget.innerHTML = ""

    const capsule = this.templateTarget.content.cloneNode(true)

    capsule.querySelector("[data-multi-select-target='name']").textContent = selectedName
    capsule.querySelector("[data-multi-select-target='value']").value = selectedValue
    
    this.containerTarget.appendChild(capsule)
    
    this.selectTarget.selectedIndex = 0
  }

  remove(event) {
    event.preventDefault()
    event.target.closest(".capsule").remove()
  }

  showFlash(message) {
    const flashElement = document.createElement("div")
    flashElement.className = "p-3 bg-red-100 border border-red-400 text-red-700 rounded-md text-sm"
    flashElement.textContent = message
    this.flashContainerTarget.innerHTML = ""
    this.flashContainerTarget.appendChild(flashElement)
  }
}

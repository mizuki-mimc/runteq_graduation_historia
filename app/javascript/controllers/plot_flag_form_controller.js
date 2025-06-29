import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "select", "container", "template", "flashContainer" ]

  add(event) {
    event.preventDefault()
    
    const selectedOption = this.selectTarget.selectedOptions[0]
    const flagId = selectedOption.value
    
    if (!flagId) {
      this.showFlash("フラグを選択してください。")
      return
    }

    const isDuplicate = Array.from(this.containerTarget.querySelectorAll("input[data-flag-id]"))
                             .some(input => input.value === flagId)
    if (isDuplicate) {
      this.showFlash("このフラグはすでに追加されています。")
      return
    }

    this.clearFlash()

    const isAlreadyCreated = selectedOption.dataset.isCreated === 'true'

    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.containerTarget.insertAdjacentHTML("beforeend", content)
    
    const newRow = this.containerTarget.lastElementChild
    
    newRow.querySelector("[data-role='flag-name']").textContent = selectedOption.text
    newRow.querySelector("input[data-flag-id]").value = flagId

    const createdCheckbox = newRow.querySelector("input[data-role='check-created']")
    const recoveredCheckbox = newRow.querySelector("input[data-role='check-recovered']")

    if (isAlreadyCreated) {
      recoveredCheckbox.checked = true
    } else {
      createdCheckbox.checked = true
    }
    
    this.selectTarget.selectedIndex = 0
  }

  remove(event) {
    event.preventDefault()
    const item = event.target.closest(".nested-flag-fields")
    const destroyInput = item.querySelector("input[name*='_destroy']")
    if (destroyInput) {
      destroyInput.value = '1'
      item.style.display = 'none'
    } else {
      item.remove()
    }
  }

  toggleCheckbox(event) {
    const currentCheckbox = event.target
    const row = currentCheckbox.closest(".nested-flag-fields")
    const createdCheckbox = row.querySelector("input[data-role='check-created']")
    const recoveredCheckbox = row.querySelector("input[data-role='check-recovered']")
    if (!currentCheckbox.checked) { return }
    if (currentCheckbox === createdCheckbox) {
      recoveredCheckbox.checked = false
    } else if (currentCheckbox === recoveredCheckbox) {
      createdCheckbox.checked = false
    }
  }

  showFlash(message) {
    this.flashContainerTarget.innerHTML = `<div class="p-2 bg-red-100 border border-red-400 text-red-700 rounded-md text-sm">${message}</div>`
  }

  clearFlash() {
    this.flashContainerTarget.innerHTML = ""
  }
}

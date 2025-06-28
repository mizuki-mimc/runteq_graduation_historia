import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "template", 
    "container", 
    "inputType", 
    "inputExplanation",
    "flashContainer",
    "modalPlaceholder"
  ]

  add(event) {
    event.preventDefault()
    const categoryId = this.inputTypeTarget.value
    const categoryName = this.inputTypeTarget.selectedOptions[0].text
    const explanation = this.inputExplanationTarget.value
    if (!categoryId || explanation.trim() === "") {
      this.showFlash("特徴と説明の両方を入力してください。")
      return
    }
    this.flashContainerTarget.innerHTML = ""
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.containerTarget.insertAdjacentHTML("beforeend", content)
    const newCapsule = this.containerTarget.lastElementChild
    newCapsule.querySelector("[data-nested-form-target='capsuleText']").textContent = `${categoryName} / ${explanation}`
    newCapsule.querySelector("[data-nested-form-target='hiddenCategoryId']").value = categoryId
    newCapsule.querySelector("[data-nested-form-target='hiddenExplanation']").value = explanation
    this.inputExplanationTarget.value = ""
    this.inputTypeTarget.selectedIndex = 0
  }

  remove(event) {
    event.preventDefault()
    const wrapper = event.target.closest(".nested-fields-wrapper")

    const removalLogic = () => {
      if (wrapper.dataset.newRecord === "true") {

        wrapper.remove()
      } else {

        wrapper.style.display = "none"
        const destroyInput = wrapper.querySelector("input[name*='_destroy']")
        destroyInput.value = "1"
      }
    }

    this.showConfirmationModal("この特徴を削除しますか？", removalLogic)
  }

  showConfirmationModal(message, callback) {

    this.hideConfirmationModal()

    const modalHTML = `
      <div class="fixed inset-0 bg-gray-900 bg-opacity-50 transition-opacity" data-action="click->nested-form#hideConfirmationModal"></div>
      <div class="fixed inset-0 z-10 w-screen overflow-y-auto">
        <div class="flex min-h-full items-center justify-center p-4 text-center">
          <div class="relative transform overflow-hidden rounded-lg bg-white text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg">
            <div class="bg-white px-4 pb-4 pt-5 sm:p-6 sm:pb-4">
              <div class="sm:flex sm:items-start">
                <div class="mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-red-100 sm:mx-0 sm:h-10 sm:w-10">
                  <svg class="h-6 w-6 text-red-600" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" /></svg>
                </div>
                <div class="mt-3 text-center sm:ml-4 sm:mt-0 sm:text-left">
                  <h3 class="text-base font-semibold leading-6 text-gray-900">特徴の削除</h3>
                  <div class="mt-2"><p class="text-sm text-gray-500">${message}</p></div>
                </div>
              </div>
            </div>
            <div class="bg-gray-50 px-4 py-3 sm:flex sm:flex-row-reverse sm:px-6">
              <button type="button" data-action="click->nested-form#confirmAndHide" class="inline-flex w-full justify-center rounded-md bg-red-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-500 sm:ml-3 sm:w-auto">削除する</button>
              <button type="button" data-action="click->nested-form#hideConfirmationModal" class="mt-3 inline-flex w-full justify-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50 sm:mt-0 sm:w-auto">キャンセル</button>
            </div>
          </div>
        </div>
      </div>
    `
    this.modalPlaceholderTarget.innerHTML = modalHTML
    this.confirmCallback = callback
  }

  hideConfirmationModal() {
    this.modalPlaceholderTarget.innerHTML = ""
    this.confirmCallback = null
  }

  confirmAndHide() {

    if (this.confirmCallback) {
      this.confirmCallback()
    }
    this.hideConfirmationModal()
  }


  showFlash(message) {
    const flashEl = document.createElement("div")
    flashEl.className = "p-3 bg-red-100 border border-red-400 text-red-700 rounded-md text-sm"
    flashEl.textContent = message
    this.flashContainerTarget.innerHTML = ""
    this.flashContainerTarget.appendChild(flashEl)
  }
}

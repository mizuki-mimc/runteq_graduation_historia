import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "container", "image" ]

  open(event) {
    event.preventDefault()
    const imageUrl = event.params.src
    this.imageTarget.src = imageUrl
    this.containerTarget.classList.remove("hidden")
  }

  close() {
    this.containerTarget.classList.add("hidden")
    this.imageTarget.src = ""
  }
}

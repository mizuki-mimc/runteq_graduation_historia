import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  connect() {
    console.log("Accordion controller connected!");
    this.contentTargets.forEach(content => {
      content.style.display = 'none';
    });
  }

  toggle(event) {
    console.log("Toggle method called!");
    const header = event.currentTarget;
    const content = header.nextElementSibling;

    if (content.style.display === 'none') {
      content.style.display = 'block';
      header.classList.add('expanded');
    } else {
      content.style.display = 'none';
      header.classList.remove('expanded');
    }
  }
}

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["overlay", "modalBox", "handle", "page", "currentPage", "prevButton", "nextButton", "videoElement"];

  static values = {
    pageIndex: { type: Number, default: 0 }
  };

  isDragging = false;
  offsetX = 0;
  offsetY = 0;

  connect() {
    this.showPage(this.pageIndexValue);
  }

  open(event) {
    event.preventDefault();
    this.overlayTarget.classList.remove("hidden");
    this.modalBoxTarget.style.left = '50%';
    this.modalBoxTarget.style.top = '50%';
    this.modalBoxTarget.style.transform = 'translate(-50%, -50%)';
    this.showPage(0);
  }

  close() {
    this.overlayTarget.classList.add("hidden");
    this.videoElementTargets.forEach(video => {
      video.pause();
      video.currentTime = 0;
    });
  }

  startDrag(event) {
    event.preventDefault();
    this.isDragging = true;

    const rect = this.modalBoxTarget.getBoundingClientRect();
    this.offsetX = event.clientX - rect.left;
    this.offsetY = event.clientY - rect.top;
    document.addEventListener('mousemove', this.drag.bind(this));
    document.addEventListener('mouseup', this.endDrag.bind(this));

    this.handleTarget.style.cursor = 'grabbing';
  }

  drag(event) {
    if (!this.isDragging) return;

    let newLeft = event.clientX - this.offsetX;
    let newTop = event.clientY - this.offsetY;

    const viewportWidth = window.innerWidth;
    const viewportHeight = window.innerHeight;
    const modalWidth = this.modalBoxTarget.offsetWidth;
    const modalHeight = this.modalBoxTarget.offsetHeight;

    newLeft = Math.max(0, Math.min(newLeft, viewportWidth - modalWidth));
    newTop = Math.max(0, Math.min(newTop, viewportHeight - modalHeight));

    this.modalBoxTarget.style.left = `${newLeft}px`;
    this.modalBoxTarget.style.top = `${newTop}px`;
    this.modalBoxTarget.style.transform = 'none';
  }

  endDrag() {
    this.isDragging = false;
    document.removeEventListener('mousemove', this.drag.bind(this));
    document.removeEventListener('mouseup', this.endDrag.bind(this));

    this.handleTarget.style.cursor = 'grab';
  }

  nextPage() {
    if (this.pageIndexValue < this.pageTargets.length - 1) {
      this.pageIndexValue++;
      this.showPage(this.pageIndexValue);
    }
  }

  prevPage() {
    if (this.pageIndexValue > 0) {
      this.pageIndexValue--;
      this.showPage(this.pageIndexValue);
    }
  }

  showPage(index) {
    this.pageTargets.forEach((page, i) => {
      if (i !== index) {
        const video = page.querySelector('video[data-guide-modal-target="videoElement"]');
        if (video) {
          video.pause();
          video.currentTime = 0;
        }
      }
      page.classList.toggle("hidden", i !== index);
    });

    const currentPageElement = this.pageTargets[index];
    const videoToPlay = currentPageElement.querySelector('video[data-guide-modal-target="videoElement"]');
    if (videoToPlay) {
      videoToPlay.play().catch(error => {
        console.warn("動画の自動再生がブロックされました:", error);
      });
    }

    this.currentPageTarget.textContent = `${index + 1} / ${this.pageTargets.length}`;

    this.prevButtonTarget.classList.toggle("opacity-50", index === 0);
    this.prevButtonTarget.classList.toggle("cursor-not-allowed", index === 0);
    this.prevButtonTarget.disabled = (index === 0);

    this.nextButtonTarget.classList.toggle("opacity-50", index === this.pageTargets.length - 1);
    this.nextButtonTarget.classList.toggle("cursor-not-allowed", index === this.pageTargets.length - 1);
    this.nextButtonTarget.disabled = (index === this.pageTargets.length - 1);
  }
}

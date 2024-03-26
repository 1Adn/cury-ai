import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {

  static targets = ["section"];

  connect() {
    this.showSection(this.sectionTargets[0].id);
  }

  showSection(sectionId) {
    this.sectionTargets.forEach((section) => {
      section.classList.toggle("d-none", section.id !== sectionId);
    });
  }

  changeSection(event) {
    event.preventDefault();
    const sectionId = event.currentTarget.dataset.target;
    this.showSection(sectionId);
  }
}

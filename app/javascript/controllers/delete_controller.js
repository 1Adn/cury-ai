import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }

  delete() {
    if (confirm("Are you sure you want to delete this item?")) {
      fetch(this.urlValue, {
        method: 'DELETE',
        headers: {
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").getAttribute("content"),
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        credentials: "include"
      }).then(response => {
        if (response.ok) {
          this.removeElement();
        } else {
          alert("Failed to delete the item.");
        }
      });
    }
  }

  removeElement() {
    this.element.closest('.accordion-item').remove();
  }
}

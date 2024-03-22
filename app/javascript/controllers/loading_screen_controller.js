import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["loader", "loadingText"];

  connect() {
    this.showLoading();
    this.simulateLoading();
  }

  // showLoading() {
  //   this.loaderTarget.style.display = "flex";
  // }

  // hideLoading() {
  //   this.loaderTarget.style.display = "none";
  // }

  // simulateLoading() {
  //   setTimeout(() => {
  //     this.hideLoading();
  //   }, 3000);
  // }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement"]
  connect() {
    console.log("Hello from toggle_controller.js")
  }
  fire() {
    console.log("fire");
    this.togglableElementTarget.classList.toggle("d-none");
    this.togglableElementTarget.classList.toggle("show-dropdown");
  }

  search(event) {
    console.log(this.togglableElementTargets);
    this.togglableElementTargets.forEach((element) => {
      element.classList.remove("d-none");
    });
  }
}

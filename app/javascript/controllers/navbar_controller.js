import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static values  = { visible: Boolean }
  static targets = ["drawer", "navbar"];
  static classes = ["hidden"]

  toggle() {
    if (this.visibleValue) {
      this.closeDrawer();
    } else {
      this.openDrawer();
    }
    this.visibleValue = !this.visibleValue
    // console.log(this.visibleValue)
    // this.visibleValue = !this.visibleValue
  }
  
  openDrawer() {
    this.drawerTarget.classList.remove("hidden");
  }

    closeDrawer() {
      this.drawerTarget.classList.add("hidden");
    }
}

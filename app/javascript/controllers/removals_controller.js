import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  static targets = ["alert"];
  
  connect() {
      // Get the time in milliseconds after which you want to remove the alert (e.g., 5000ms = 5 seconds)
    const removalTime = 2000;
      // Call the `removeAlert` function after the specified time
      setTimeout(() => {
        this.removeAlert();
      }, removalTime);
    }
    removeAlert() {
      // Remove the alert element from the DOM
      this.alertTarget.remove();
    }
  
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-alert"
export default class extends Controller {
  connect() {
    setTimeout(function(){
      document.getElementById("alert-bar").style.display = "none"
  }, 5000);
  }
}

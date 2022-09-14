
​import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  hideModal() {
    console.log("HERERERERERERERER")
    this.element.parentElement.removeAttribute("src") // it might be nice to also remove the modal SRC
    this.element.remove()
  }
  submitEnd(e) {
    debugger;
    console.log("HER")
    debugger;
    console.log(e)
    this.hideModal()
  }
}
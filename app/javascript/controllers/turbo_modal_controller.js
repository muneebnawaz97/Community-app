import {Controller}  from "@hotwired/stimulus"
export default class extends Controller {
  
  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

  submitEnd(e) {
    if(document.getElementById("title")) {
      let title = e.target.getElementsByClassName("data")[0].value
      document.getElementById("title").innerHTML = title    
    }
    
    if(e.detail.success) {
      this.hideModal()
    }
  }
}
import {Controller}  from "@hotwired/stimulus"
export default class extends Controller {
  
  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

  submitEnd(e) {
    if(document.getElementById("post-edit")) {
      if (e.detail.success) {
        Turbo.visit(e.detail.fetchResponse.response.url)
      }
    }
    if(document.getElementById("title") && e.target.getElementsByClassName("data")[0]) {
      let title = e.target.getElementsByClassName("data")[0].value
      document.getElementById("title").innerHTML = title   
    }
    
    if(e.detail.success) {
      this.hideModal()
      document.getElementById("empty-box").style.display= "none"
    }
  }

}
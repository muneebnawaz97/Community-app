import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-comment"
export default class extends Controller {
  static targets = ['content']
  
  edit() {
    const comment_id = this.data.get("myValue")
    document.getElementById("comment-"+comment_id).style.display = "none"
    document.getElementById("form-"+comment_id).style.display = ""
  }

  submitEnd(e) {
    e.preventDefault()
    const comment_id = this.data.get("myValue")
    document.getElementById("comment-" + comment_id).style.display = ""
    document.getElementById("form-" + comment_id).style.display = "none"
    document.getElementById("content-" + comment_id).innerHTML = this.contentTarget.value
  }
}

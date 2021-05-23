import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";


export default class extends Controller{
  static targets = [ 'postthread' ];
  static targets = [ 'user' ];
  

  connect(){
  }
  
  dragstart(event) {
    event.dataTransfer.setData("application/drag-key", event.target.getAttribute("id"))
    event.dataTransfer.effectAllowed = "move"
  } 

  dragover(event) {
    event.preventDefault()
    return true
  }
   
  dragenter(event) {
    event.preventDefault();
  }
   
  dragleave(event) {
    event.preventDefault();
  } 

  dragend = (event) =>{
    const threadId = event.currentTarget.id;
    const userId = this.userTarget.id;
    const newStatus = event.target.closest(".sortable-container").querySelector("h3").innerText;
    fetch(`/users/${userId}/postthreads/${threadId}`, {
      method: "PATCH",
      headers:{
        "X-CSRF-Token": csrfToken(),
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ postthread: { thread_status: newStatus } })
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    });
  }
}
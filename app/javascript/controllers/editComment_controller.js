// import { Controller } from "stimulus";

// export default class extends Controller {
//   static targets = [ 'edit' ];
  
//   connect() {
//     console.log('Hello!');
//     console.log(this.editTarget)
//   }

//   editForm() {
//     console.log(this.editTarget)
//     this.editTarget.innerHTML.replaceWith(' '"<%= form_for([@post, @comment]) do |f| % ><p><%= f.label :body %><br><%= f.text_area(:body, {:class => 'form-control'}) %></p><p><%= f.submit({:class => 'btn btn-outline-success'}) %></p><% end %>"
//   };
// }

// refresh() {
//   fetch('/restaurants', { headers: { accept: "application/json" } })
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data);
//     });
// }

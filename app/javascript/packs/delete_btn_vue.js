/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import App from '../delete_btn.vue'

document.addEventListener('DOMContentLoaded', () => {
	const app = new Vue({
		      render: h => h(App)
		    }).$mount()
	const material_selects = document.querySelector('#material_selects')
	  let delete_btn = material_selects.querySelectorAll('.delete_btn')
	  
	delete_btn.forEach(function(target){
		target.appendChild(app.$el)
	});
    const add_btn = document.querySelector('#select_add_btn')	
	add_btn.addEventListener('click', () => {
		console.log(material_selects);
		let del_btn = material_selects.querySelector('.delete_btn').lastChild;
		console.log(del_btn)
		del_btn.appendChild(app.$el)
	})

})



// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks


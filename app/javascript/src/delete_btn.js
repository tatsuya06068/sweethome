document.addEventListener('DOMContentLoaded', () => {
	
	const delete_btn = document.querySelector('#select_del_btn');
	
		delete_btn.addEventListener('click', () => {
			let material_selects = document.querySelector('#material_selects');
			let num = material_selects.querySelectorAll('select').length

			if(num > 1){
			let target_select = material_selects.lastChild;
			target_select.remove();
			};
		});
});


window.addEventListener('load', () =>{
	const add_btn = document.querySelector('#select_add_btn');
     
	let num = 0;

	add_btn.addEventListener('click', () => {
		let material_selects = document.querySelector('#material_selects');
		let clone = material_selects.querySelector('.material_select').cloneNode(true);
		let add_select = document.querySelector('#add_select')
		
		material_selects.appendChild(clone);

		let target_select = material_selects.lastChild.querySelector('select');
		num	= material_selects.querySelectorAll('select').length - 1;
		target_select.name = 'product[materials_useds_attributes][' + num + '][material_id]';
		target_select.id = 'product_materials_useds_attributes_' + num + '_material_id';
		
	});


});




window.addEventListener('load', () =>{
	const add_btn = document.querySelector('#select_add_btn');
    let num = 1;
	add_btn.addEventListener('click', () => {
		let parent_select = document.querySelector('#parent_select');
		let clone = parent_select.firstChild.cloneNode(true);
		let add_select = document.querySelector('#add_select')
	
		add_select.appendChild(clone);
		
		let target_select = add_select.lastChild;
		
		target_select.name = 'product[materials_useds_attributes][' + num + '][material_id]';
		target_select.id = 'product_materials_useds_attributes_' + num + '_material_id';

		num++;
	});
});



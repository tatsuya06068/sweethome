document.addEventListener('DOMContentLoaded', () => {
	
	let delete_btns = document.querySelectorAll('.delete_btn');
	
	delete_btns.forEach((elm) =>{
		elm.addEventListener('click', () => {
			alert(elm);
			console.log(elm);
			let material_selects = document.querySelector('#material_selects');	
			let select_cnt = material_selcts.children.length;
		
			elm.parentNode.remove();
			material_selects.querySelector('delete_btn');
		});
	});
});

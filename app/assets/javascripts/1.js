$(document).ready(function(){
	$( "#product" ).autocomplete({
      source: location.protocol + '//' + location.host + "/products/autocomplete.json",
      minLength: 2,
      select: function( event, ui ) {
      	// alert(ui.item.id);
        $("#inventory_product_id").val(ui.item.id);
      }
    });
});
	 // [p.name, ' MARCA:', p.brand.name,  ' CANTIDAD:', p.amount, ' DESCRIPCION:', p.description].join('') 

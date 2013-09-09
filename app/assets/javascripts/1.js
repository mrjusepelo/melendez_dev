// alert("hola mundo");
$(document).ready(function(){
	$( "#product" ).autocomplete({
      source: location.protocol + '//' + location.host + "/products/autocomplete.json",
      minLength: 2,
      select: function( event, ui ) {
        $("#product_id").val(ui.item.id);
      }
    });
});

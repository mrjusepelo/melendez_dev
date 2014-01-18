$(document).ready(function(){
	var f21 = new LiveValidation('inventory_serial');
	f21.add( Validate.Presence, { failureMessage: "Este campo no puede ser Vacio" } );

	var f21 = new LiveValidation('inventory_supplier_id');
	f21.add( Validate.Presence, { failureMessage: "Este campo no puede ser Vacio" } );



	var f21 = new LiveValidation('inventory_vale_buy');
	f21.add( Validate.Presence, { failureMessage: "Este campo no puede ser Vacio" } );

	var f21 = new LiveValidation('inventory_vale_sale');
	f21.add( Validate.Presence, { failureMessage: "Este campo no puede ser Vacio" } );

	var f21 = new LiveValidation('inventory_iva');
	f21.add( Validate.Presence, { failureMessage: "Este campo no puede ser Vacio" } );

	var f21 = new LiveValidation('datepi');
	f21.add( Validate.Presence, { failureMessage: "Este campo no puede ser Vacio" } );




	
 var field3 = new LiveValidation( 'warranty', {onlyOnSubmit: true } );
  field3.add( Validate.Numericality);

	// var field3 = new LiveValidation( 'inventory_warranty', {onlyOnSubmit: true } );
	// field3.add( Validate.Presence );
// Validate.Presence( "inventory[warranty]", { failureMessage: "Supply a value!" } );
	// console.log($('input[name="inventory[warranty]"]').val())



	// $( "#product" ).autocomplete({
 //      source: location.protocol + '//' + location.host + "/products/autocomplete.json",
 //      minLength: 2,
 //      select: function( event, ui ) {
 //      	// alert(ui.item.id);
 //        $("#inventory_product_id").val(ui.item.id);
 //      }
 //    });


// var myField = new LiveValidation('myField');
// access the LiveValidationForm object through one of its child LiveValidation objects form property
// myfield.form.destroy(true);


// var myField = new LiveValidation('myField');
// myfield.destroy();

// Validate.Length( 'cow', { minimum: 3, maximum: 255 } )

// Validate.Numericality( 2e3, { minimum: -5, maximum: 2000 } );







});
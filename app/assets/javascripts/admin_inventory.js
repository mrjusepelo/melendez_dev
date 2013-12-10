$(document).ready(function(){
 // alert('coasd');
});

function createSerials(cantidad){
// inventory_serial_input
    // var clon = document.getElementById('inventory_serial_input').cloneNode(true);
    var clon = $('#inventory_serial_input').clone(true);
    $(cantidad).removeAttr("onBlur");
    $("#inventory_serial").attr('name', 'serial'+1);


    // $("li#inventory_barcode_input").next().append('<h1>Texto hijo de serial</h1>');
    // $('li#inventory_serial_input').parent().append(clon);
    // $('li#inventory_serial_input').parent().after('');
    // $( "li#inventory_serial_input" ).siblings('<li class="string input required stringish" id="inventory_serial_input"><label class="label" for="inventory_serial">Serial<abbr title="requerido">*</abbr></label><input id="inventory_serial" maxlength="255" name="inventory[serial]" type="text"></li>');
    // $(clon).insertAfter('li#inventory_supplier_input')
    // $('li#inventory_supplier_input').before(clon);
    // $(cantidad).parent().after(clon);


    // $('li#inventory_serial_input').parent().find('li#inventory_serial_input').after().after(clon);






    // $('li#inventory_serial_input').parent().after('li#inventory_serial_input').append(clon);
    // $(clon).insertAfter('li#inventory_serial_input');   

    // $('li#inventory_serial_input').after(clon);   

// $([1,2,3]).each(function(i, v){
//     console.log('indice es ' + i + "valor " + v );
//     $(cantidad).parent().after('<li class="string input required stringish" id="inventory_serial_input"><label class="label" for="inventory_serial">Serial<abbr title="requerido">*</abbr></label><input id="inventory_serial" maxlength="255" name="inventory[serial]" type="text"></li>');

// });

incName = 0;
// for (var i =1; i <= 3; i++) {
for (var i =1; i < $(cantidad).val(); i++) {
console.log('impresion'+i);
incName = i+1; 
    // $(cantidad).parent().after('<li class="string input required stringish" id="inventory_serial_input"><label class="label" for="inventory_serial">Serial<abbr title="requerido">*</abbr></label><input id="inventory_serial" maxlength="255" name="inventory[serial][' + i + ']" type="text"></li>'  );
    $(cantidad).parent().after('<li class="string input required stringish" id="inventory_serial_input"><label class="label" for="inventory_serial">Serial<abbr title="requerido">*</abbr></label><input id="inventory_serial" maxlength="255" name="" type="text"></li>'  );
    $("#inventory_serial").attr('name', 'serial'+incName);

    // $('li#inventory_serial_input').after(clon);   

    // $('li#inventory_serial_input').parent().append(clon);
    // $('li#inventory_serial_input').parent().first().append('<li class="string input required stringish" id="inventory_serial_input"><label class="label" for="inventory_serial">Serial<abbr title="requerido">*</abbr></label><input id="inventory_serial" maxlength="255" name="inventory[serial]" type="text"></li>');
};

    // $('li#inventory_serial_input').parent().find("li#inventory_barcode_input input#inventory_serial").next().append(clon);
    // $('input#amount').parent().next().append(clon);
    

    // $('li#inventory_barcode_input').next().append(clon);


}
// $("[id|='myValue']")
// $("[id$='txtTitle']")
// console.log(($("[id$='ount']").val())) // imperesion por consola el valor del id terminado en ount
// $("[id$='buyer']").prop('checked', true) //selecciona el id terminado en buyer 
// $("element[id$='txtTitle']")



// <li class="string input required stringish" id="inventory_serial_input"><label class="label" for="inventory_serial">Serial<abbr title="requerido">*</abbr></label><input id="inventory_serial" maxlength="255" name="inventory[serial]" type="text"></li>
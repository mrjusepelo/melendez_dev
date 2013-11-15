$(document).ready(function(){

});

function sumavalorcredito(total){
    var sum = 0;
    $('.val_product').each(function() {
        sum += Number($(this).val());
    });
    $(total).val(sum);
  console.log("valor factura "+ sum);
}

function valorproductos(valor){

    cantidad =    $(valor).parent().parent().find("#amount").val();
    valor_unidad =    $(valor).parent().parent().find("#unit_value").val();
    $(valor).val(cantidad * valor_unidad);
	console.log( cantidad * valor_unidad );
}

function calcularPagos(valor){

    numPagos =    $('#number_payments').val();
    totalCredito =    $("#total").val();
    valorCuotas = (totalCredito / numPagos);
    $(valor).val(valorCuotas);
    console.log( valorCuotas );
}

function eleccionComprador(rol){
   console.log( $(rol).parent().prop("nodeName"));

    $(rol).parent().removeAttr("onClick");

    if ($(rol).is (':checked')){
    //     $(rol).prop('checked', true);
        $(rol).parent().parent().parent().find($("input[id$='bondsman']")).prop('checked', false);

    } 
}
function eleccionFiador(rol){
   console.log( $(rol).parent().prop("nodeName"));
    $(rol).parent().removeAttr("onClick");
    
    if ($(rol).is (':checked')){
    //     $(rol).prop('checked', true);
        // $(rol).parent().parent().parent().find($("input[id$='buyer']").prop('checked', false));
        $(rol).parent().parent().parent().find($("input[id$='buyer']")).prop('checked', false);
    } 
}
// $("[id|='myValue']")
// $("[id$='txtTitle']")
// console.log(($("[id$='ount']").val())) // imperesion por consola el valor del id terminado en ount
// $("[id$='buyer']").prop('checked', true) //selecciona el id terminado en buyer 
// $("element[id$='txtTitle']")
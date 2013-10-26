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
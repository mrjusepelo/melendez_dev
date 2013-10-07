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
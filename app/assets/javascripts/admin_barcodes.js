$(document).ready(function(){
// alert('Mensaje de carga');
llenar_codigos();
// $("#bcTarget").barcode(a, "code128"); 
});


function llenar_codigos(){
	amount_codigos = $("td#value_code").length
	var i = 0;
    $("td.value_code").each(function(){
    	i = i+1;
        var objCode = $(this);

        // for (var i = 0; i < parseInt(amount_codigos); i ++){
    	console.log(i);

            $(this).parent().parent().parent().find($("div#bcTarget")).barcode(objCode.text(), "code128");				


    });


$('a.media').media({width:500, height:400});


}



$(document).ready(function(){

search_client();
// if ($("div.clients a").click()) {$("#cclient_json").after("<input type='button' value='verificar'>");};

// var elementos = $('.clients a');
// var size = elementos.size();
// var arrayID = [];
 
// $.each( elementos, function(i, val){
//     arrayID.push( $(val).parent().attr('id') );
// });
// $(".clients a:last").click()




$(".clients a:last").click(function() {
  $("input#cclient_json:last").after("<input onclick='search_client(this)' type='button' value='verificar'>");
});
});

function create_button (argument) {

}




function search_client(btn_varify){
  
  // $( "#cclient_json" ).blur(function() {
  a = $( btn_varify ).parent().find("#cclient_json").val();

 console.log(a);    

 var cclient = $( btn_varify ).parent().find("#cclient_json").val();
        $.get("/clients/verify_client.json?cclient="+cclient, function(response_client){

          console.log(response_client);

          // if (response_client.id != undefined) 
          // if (response_client.id ) 
         // if (typeof response_client.id !== "undefined" || response_client.id !== null)
         if( ""+response_client !== "null" && ""+response_client !== "undefined")
            {
              // console.log($( btn_varify ).parent().parent());
              // // $("div.clients a").click();
              // // $("#field_name").val(response_client.name);
              // // $("#field_document").val(response_client.document);
              // // $("#field_city").val(response_client.city_id);
              // // $("#field_address").val(response_client.address);
              // // $("#field_neihborhood").val(response_client.neihborhood);
              // // $("#field_phone").val(response_client.phone);
              // // $("#field_city").val(response_client.city_id);
              // // $('#field_buyer').prop('checked', response_client.buyer)
              // // $("#field_bondsman").prop('checked', response_client.bondsman);
              // // $("#field_buyer").val();

              // // $( btn_varify ).parent().find("div.clients a").click();
              $( btn_varify ).parent().parent().find("#field_name").val(response_client.name);
              $( btn_varify ).parent().parent().find("#field_document").val(response_client.document);
              $( btn_varify ).parent().parent().find("#field_city").val(response_client.city_id);
              $( btn_varify ).parent().parent().find("#field_address").val(response_client.address);
              $( btn_varify ).parent().parent().find("#field_neihborhood").val(response_client.neihborhood);
              $( btn_varify ).parent().parent().find("#field_phone").val(response_client.phone);
              $( btn_varify ).parent().parent().find("#field_city").val(response_client.city_id);
              $( btn_varify ).parent().parent().find('#field_buyer').prop('checked', response_client.buyer)
              $( btn_varify ).parent().parent().find("#field_bondsman").prop('checked', response_client.bondsman);


            };

      
        //   $('#plan_id').empty()
        // $.each(data_agreement.plans, function (i, item) {
        //     $('#plan_id').append($('<option>', { 
        //         value: item.plan.name,
        //         text : item.plan.name 
        //     }));
        // });


        
        // });
        // // $.get(location.protocol + '//' + location.host +"/agreements/autocomplete.json?agreement_id="+agreement_id, function(hash_response){
        //   // console.log(hash_response);
        // });
  });

}
















































function noEnviar(e, elemento) {
    if (e.keyCode == 13) {
      // $('#ui-id-120').click();
      $('ul.ui-autocomplete li.ui-menu-item a').click();  

        return false;
    }
}


function busquedaProducto(elemento){

     var i = 0;
    i = document.getElementsByClassName('idprod').length
    $(elemento).css({'color':'black','font-size':'1.3em','background':'rgb(231, 231, 231)', 'font-weight': 'bold'});

    $(elemento).autocomplete({
      source: location.protocol + '//' + location.host + "/credits/autocomplete.json",
      minLength: 2,
      select: function( event, ui ) {
        $(elemento).parent().parent().find("#product_id").val(ui.item.id);
        $(elemento).parent().parent().find("#unit_value").val(ui.item.vale_sale);
        // debugger;
      } 



    });


  var style = document.createElement('style');
  style.type = 'text/css';
     style.innerHTML = '.ui-helper-hidden {  display: none;}.ui-helper-hidden-accessible {border: 0;clip: rect(0 0 0 0);height: 1px;margin: -1px;overflow: hidden;padding: 0;position: absolute;width: 1px;}.ui-helper-reset {margin: 0;padding: 0;border: 0;outline: 0;line-height: 1.3;  text-decoration: none;  font-size: 100%;  list-style: none;}.ui-helper-clearfix:before,.ui-helper-clearfix:after {  content: "";  display: table; border-collapse: collapse;}.ui-helper-clearfix:after {  clear: both;}.ui-helper-clearfix {  min-height: 0; }.ui-helper-zfix { width: 100%;  height: 100%; top: 0; left: 0;  position: absolute; opacity: 0; filter:Alpha(Opacity=0);}.ui-front {  z-index: 100;}.ui-state-disabled {  cursor: default !important;}.ui-icon {  display: block; text-indent: -99999px;  overflow: hidden; background-repeat: no-repeat;}.ui-widget-overlay {  position: fixed;  top: 0; left: 0;  width: 100%;  height: 100%;}.ui-autocomplete {  position: absolute; top: 0; left: 0;  cursor: default;}.ui-menu { list-style: none; padding: 2px; margin: 0;  display: block; outline: none;}.ui-menu .ui-menu {  margin-top: -3px; position: absolute;}.ui-menu .ui-menu-item {  margin: 0;  padding: 0; width: 100%;  /* support: IE10, see #8844 */  list-style-image: url(data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7);}.ui-menu .ui-menu-divider {  margin: 5px -2px 5px -2px;  height: 0;  font-size: 0; line-height: 0; border-width: 1px 0 0 0;}.ui-menu .ui-menu-item a { text-decoration: none;  display: block; padding: 2px .4em;  line-height: 1.5; min-height: 0; /* support: IE7 */ font-weight: normal;}.ui-menu .ui-menu-item a.ui-state-focus,.ui-menu .ui-menu-item a.ui-state-active { font-weight: normal;  margin: -1px;}.ui-menu .ui-state-disabled { font-weight: normal;  margin: .4em 0 .2em;  line-height: 1.5;}.ui-menu .ui-state-disabled a { cursor: default;}/* icon support */.ui-menu-icons { position: relative;}.ui-menu-icons .ui-menu-item a {  position: relative; padding-left: 2em;}/* left-aligned */.ui-menu .ui-icon {  position: absolute; top: .2em;  left: .2em;}/* right-aligned */.ui-menu .ui-menu-icon { position: static; float: right;}/* Component containers----------------------------------*/.ui-widget { font-family: Verdana,Arial,sans-serif;  font-size: 1.1em;}.ui-widget .ui-widget { font-size: 1em;}.ui-widget input,.ui-widget select,.ui-widget textarea,.ui-widget button {  font-family: Verdana,Arial,sans-serif;  font-size: 1em;}.ui-widget-content {  border: 1px solid #aaaaaa;  background: #ffffff url(/assets/images/ui-bg_flat_75_ffffff_40x100.png) 50% 50% repeat-x; color: #222222;}.ui-widget-content a {  color: #222222;}.ui-widget-header { border: 1px solid #aaaaaa;  background: #cccccc url(/assets/images/ui-bg_highlight-soft_75_cccccc_1x100.png) 50% 50% repeat-x;  color: #222222; font-weight: bold;}.ui-widget-header a {  color: #222222;}/* Interaction states----------------------------------*/.ui-state-default,.ui-widget-content .ui-state-default,.ui-widget-header .ui-state-default { border: 1px solid #d3d3d3;  background: #e6e6e6 url(/assets/images/ui-bg_glass_75_e6e6e6_1x400.png) 50% 50% repeat-x; font-weight: normal;  color: #555555;}.ui-state-default a,.ui-state-default a:link,.ui-state-default a:visited {  color: #555555; text-decoration: none;}.ui-state-hover,.ui-widget-content .ui-state-hover,.ui-widget-header .ui-state-hover,.ui-state-focus,.ui-widget-content .ui-state-focus,.ui-widget-header .ui-state-focus {  border: 1px solid #999999;  background: #dadada url(/assets/images/ui-bg_glass_75_dadada_1x400.png) 50% 50% repeat-x; font-weight: normal;  color: #212121;}.ui-state-hover a,.ui-state-hover a:hover,.ui-state-hover a:link,.ui-state-hover a:visited {  color: #212121; text-decoration: none;}.ui-state-active,.ui-widget-content .ui-state-active,.ui-widget-header .ui-state-active {  border: 1px solid #aaaaaa;  background: #ffffff url(/assets/images/ui-bg_glass_65_ffffff_1x400.png) 50% 50% repeat-x; font-weight: normal;  color: #212121;}.ui-state-active a,.ui-state-active a:link,.ui-state-active a:visited { color: #212121; text-decoration: none;}/* Interaction Cues----------------------------------*/.ui-state-highlight,.ui-widget-content .ui-state-highlight,.ui-widget-header .ui-state-highlight {  border: 1px solid #fcefa1;  background: #fbf9ee url(/assets/images/ui-bg_glass_55_fbf9ee_1x400.png) 50% 50% repeat-x; color: #363636;}.ui-state-highlight a,.ui-widget-content .ui-state-highlight a,.ui-widget-header .ui-state-highlight a {  color: #363636;}.ui-state-error,.ui-widget-content .ui-state-error,.ui-widget-header .ui-state-error {  border: 1px solid #cd0a0a;  background: #fef1ec url(/assets/images/ui-bg_glass_95_fef1ec_1x400.png) 50% 50% repeat-x; color: #cd0a0a;}.ui-state-error a,.ui-widget-content .ui-state-error a,.ui-widget-header .ui-state-error a {  color: #cd0a0a;}.ui-state-error-text,.ui-widget-content .ui-state-error-text,.ui-widget-header .ui-state-error-text { color: #cd0a0a;}.ui-priority-primary,.ui-widget-content .ui-priority-primary,.ui-widget-header .ui-priority-primary { font-weight: bold;}.ui-priority-secondary,.ui-widget-content .ui-priority-secondary,.ui-widget-header .ui-priority-secondary {  opacity: .7;  filter:Alpha(Opacity=70); font-weight: normal;}.ui-state-disabled,.ui-widget-content .ui-state-disabled,.ui-widget-header .ui-state-disabled {  opacity: .35; filter:Alpha(Opacity=35); background-image: none;}.ui-state-disabled .ui-icon { filter:Alpha(Opacity=35); /* For IE8 - See #6059 */}     ';
  document.getElementsByTagName('head')[0].appendChild(style);
return style;


}

function salida(elemento){
  $('.ui-helper-hidden-accessible').css({'display': 'none'});
    var a;
    // a = mensaje().style;
    //quita los estilos al campo product de busqueda 
    // a = busquedaProducto(elemento).style;


    var styleTags = document.getElementsByTagName('style');

    for (var i = 0; i < styleTags.length;  i++) {
      styleTags[i].innerHTML = "";

    }
    $("html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td").css({ 
    });
    var str=$(elemento).val();
    var n=str.split("-");
    console.log(n[1]);
}

function validarSiNumero(numero){
  if (!/^([0-9])*$/.test(numero.value)){
      alert("El valor " + numero.value + " no es un número");  
      $(numero).val("");
  }
}


// $("[id|='myValue']")
// $("[id$='txtTitle']")
// console.log(($("[id$='ount']").val())) // imperesion por consola el valor del id terminado en ount
// $("[id$='buyer']").prop('checked', true) //selecciona el id terminado en buyer 
// $("element[id$='txtTitle']")
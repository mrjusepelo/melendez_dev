$(document).ready(function(){

});

function fondo(elemento){

     var i = 0;
    i = document.getElementsByClassName('idprod').length
    $(elemento).css({'color':'black','font-size':'1.3em','background':'rgb(231, 231, 231)', 'font-weight': 'bold'});

      $(elemento).autocomplete({
      source: location.protocol + '//' + location.host + "/credits/autocomplete.json",
      minLength: 2,
      select: function( event, ui ) {
        $(elemento).parent().parent().find("#product_id").val(ui.item.id);
      }

    });


  var style = document.createElement('style');
  style.type = 'text/css';
     style.innerHTML = '.ui-helper-hidden {  display: none;}.ui-helper-hidden-accessible {border: 0;clip: rect(0 0 0 0);height: 1px;margin: -1px;overflow: hidden;padding: 0;position: absolute;width: 1px;}.ui-helper-reset {margin: 0;padding: 0;border: 0;outline: 0;line-height: 1.3;  text-decoration: none;  font-size: 100%;  list-style: none;}.ui-helper-clearfix:before,.ui-helper-clearfix:after {  content: "";  display: table; border-collapse: collapse;}.ui-helper-clearfix:after {  clear: both;}.ui-helper-clearfix {  min-height: 0; }.ui-helper-zfix { width: 100%;  height: 100%; top: 0; left: 0;  position: absolute; opacity: 0; filter:Alpha(Opacity=0);}.ui-front {  z-index: 100;}.ui-state-disabled {  cursor: default !important;}.ui-icon {  display: block; text-indent: -99999px;  overflow: hidden; background-repeat: no-repeat;}.ui-widget-overlay {  position: fixed;  top: 0; left: 0;  width: 100%;  height: 100%;}.ui-autocomplete {  position: absolute; top: 0; left: 0;  cursor: default;}.ui-menu { list-style: none; padding: 2px; margin: 0;  display: block; outline: none;}.ui-menu .ui-menu {  margin-top: -3px; position: absolute;}.ui-menu .ui-menu-item {  margin: 0;  padding: 0; width: 100%;  /* support: IE10, see #8844 */  list-style-image: url(data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7);}.ui-menu .ui-menu-divider {  margin: 5px -2px 5px -2px;  height: 0;  font-size: 0; line-height: 0; border-width: 1px 0 0 0;}.ui-menu .ui-menu-item a { text-decoration: none;  display: block; padding: 2px .4em;  line-height: 1.5; min-height: 0; /* support: IE7 */ font-weight: normal;}.ui-menu .ui-menu-item a.ui-state-focus,.ui-menu .ui-menu-item a.ui-state-active { font-weight: normal;  margin: -1px;}.ui-menu .ui-state-disabled { font-weight: normal;  margin: .4em 0 .2em;  line-height: 1.5;}.ui-menu .ui-state-disabled a { cursor: default;}/* icon support */.ui-menu-icons { position: relative;}.ui-menu-icons .ui-menu-item a {  position: relative; padding-left: 2em;}/* left-aligned */.ui-menu .ui-icon {  position: absolute; top: .2em;  left: .2em;}/* right-aligned */.ui-menu .ui-menu-icon { position: static; float: right;}/* Component containers----------------------------------*/.ui-widget { font-family: Verdana,Arial,sans-serif;  font-size: 1.1em;}.ui-widget .ui-widget { font-size: 1em;}.ui-widget input,.ui-widget select,.ui-widget textarea,.ui-widget button {  font-family: Verdana,Arial,sans-serif;  font-size: 1em;}.ui-widget-content {  border: 1px solid #aaaaaa;  background: #ffffff url(/assets/images/ui-bg_flat_75_ffffff_40x100.png) 50% 50% repeat-x; color: #222222;}.ui-widget-content a {  color: #222222;}.ui-widget-header { border: 1px solid #aaaaaa;  background: #cccccc url(/assets/images/ui-bg_highlight-soft_75_cccccc_1x100.png) 50% 50% repeat-x;  color: #222222; font-weight: bold;}.ui-widget-header a {  color: #222222;}/* Interaction states----------------------------------*/.ui-state-default,.ui-widget-content .ui-state-default,.ui-widget-header .ui-state-default { border: 1px solid #d3d3d3;  background: #e6e6e6 url(/assets/images/ui-bg_glass_75_e6e6e6_1x400.png) 50% 50% repeat-x; font-weight: normal;  color: #555555;}.ui-state-default a,.ui-state-default a:link,.ui-state-default a:visited {  color: #555555; text-decoration: none;}.ui-state-hover,.ui-widget-content .ui-state-hover,.ui-widget-header .ui-state-hover,.ui-state-focus,.ui-widget-content .ui-state-focus,.ui-widget-header .ui-state-focus {  border: 1px solid #999999;  background: #dadada url(/assets/images/ui-bg_glass_75_dadada_1x400.png) 50% 50% repeat-x; font-weight: normal;  color: #212121;}.ui-state-hover a,.ui-state-hover a:hover,.ui-state-hover a:link,.ui-state-hover a:visited {  color: #212121; text-decoration: none;}.ui-state-active,.ui-widget-content .ui-state-active,.ui-widget-header .ui-state-active {  border: 1px solid #aaaaaa;  background: #ffffff url(/assets/images/ui-bg_glass_65_ffffff_1x400.png) 50% 50% repeat-x; font-weight: normal;  color: #212121;}.ui-state-active a,.ui-state-active a:link,.ui-state-active a:visited { color: #212121; text-decoration: none;}/* Interaction Cues----------------------------------*/.ui-state-highlight,.ui-widget-content .ui-state-highlight,.ui-widget-header .ui-state-highlight {  border: 1px solid #fcefa1;  background: #fbf9ee url(/assets/images/ui-bg_glass_55_fbf9ee_1x400.png) 50% 50% repeat-x; color: #363636;}.ui-state-highlight a,.ui-widget-content .ui-state-highlight a,.ui-widget-header .ui-state-highlight a {  color: #363636;}.ui-state-error,.ui-widget-content .ui-state-error,.ui-widget-header .ui-state-error {  border: 1px solid #cd0a0a;  background: #fef1ec url(/assets/images/ui-bg_glass_95_fef1ec_1x400.png) 50% 50% repeat-x; color: #cd0a0a;}.ui-state-error a,.ui-widget-content .ui-state-error a,.ui-widget-header .ui-state-error a {  color: #cd0a0a;}.ui-state-error-text,.ui-widget-content .ui-state-error-text,.ui-widget-header .ui-state-error-text { color: #cd0a0a;}.ui-priority-primary,.ui-widget-content .ui-priority-primary,.ui-widget-header .ui-priority-primary { font-weight: bold;}.ui-priority-secondary,.ui-widget-content .ui-priority-secondary,.ui-widget-header .ui-priority-secondary {  opacity: .7;  filter:Alpha(Opacity=70); font-weight: normal;}.ui-state-disabled,.ui-widget-content .ui-state-disabled,.ui-widget-header .ui-state-disabled {  opacity: .35; filter:Alpha(Opacity=35); background-image: none;}.ui-state-disabled .ui-icon { filter:Alpha(Opacity=35); /* For IE8 - See #6059 */}     ';
  document.getElementsByTagName('head')[0].appendChild(style);
return style;


}

function salida(elemento){

 // $( "#inventory_product_id" ).focus( {
 //        alert( "Handler " );
 //  });

    // $("#inventory_product_id").css({'color':'black','font-size':'1.3em','background':'rgb(231, 231, 231)', 'font-weight': 'bold'});

$('.ui-helper-hidden-accessible').css({'display': 'none'});
  var a;
  // a = mensaje().style;
  a = fondo(elemento).style;


  var styleTags = document.getElementsByTagName('style');

  for (var i = 0; i < styleTags.length;  i++) {
    styleTags[i].innerHTML = "";

  }
  $("html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td").css({ 

  });
  var str=$(elemento).val();
  var n=str.split("-");
  console.log(n[1]);

// document.getElementById("inventory_product_id").focus().innerHTML='Escrito por JS'
// document.getElementById("inventory_product_id").focus().html('nuevo texto para el tercer elemento h3');
  // $("#inventory_product_id").focus();
}

// $("[id|='myValue']")
// $("[id$='txtTitle']")
// console.log(($("[id$='ount']").val())) // imperesion por consola el valor del id terminado en ount
// $("[id$='buyer']").prop('checked', true) //selecciona el id terminado en buyer 
// $("element[id$='txtTitle']")
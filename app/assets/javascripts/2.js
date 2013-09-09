// $(document).ready(function(){
  $(function() {
    $( "#datepi" ).datepicker();
  // });

// mensaje();

	// var nodo = document.getElementById( "product" );
	// if (nodo.click) {
	// 	alert("tiene el foco");
	// 	nodo.style.background='red';


	// };
});
	function mensaje(){
	var nodo = document.getElementById( "product" );

	// $("#product").css({ color: "#FFFFFF", background: "#FF0000" });
	$("ul.ui-autocomplete ").css({ 
		color: "#FFFFFF", background: "#FF0000", position: "absolute", top: 0,
		left: 0, cursor: "default", "z-index": "100"

	});
		// nodo.style.background='red';
		// nodo.style.background='red';

		// alert('tieen');
	// document.write('<link rel="stylesheet" type="text/css" href="/assets/admin.css">');
	
	// <link rel="stylesheet" type="text/css" href="DIRECCION">
	// if (!document.getElementById) document.write('<link rel="stylesheet" type="text/css" href="/css/versions4.css">');

if(document.createStyleSheet) {
  document.createStyleSheet('/assets/admin.css');
}
else {
  // var styles = "@import url('http://localhost:3000/melendez_dev/app/assets/stylesheets/admin.css');";
  var styles = "@import url('/assets/admin.css');";
  var newSS=document.createElement('link');
  newSS.rel='stylesheet';
  // newSS.href='data:text/css';
  newSS.href='data:text/css,'+escape(styles);
  document.getElementsByTagName("head")[0].appendChild(newSS);
}













	}
	function salida(){
		var nodo = document.getElementById( "product" );
			nodo.style.background='white';

		alert('tieen');

	}
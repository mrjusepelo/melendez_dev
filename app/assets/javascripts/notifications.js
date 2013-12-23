$(document).ready(function(){
	// alert("mensaje de notifications");
// <ul>
// class="header-item tabs"
// id="utility_nav"
// $('ul .header-item tabs #utility_nav')


var f = new Date();

// if (f.getHours() > 2) {

	$('li#current_user').before("<li id='icono_notifications'><a id='numNotify' href='dashboard' style='color: black;  vertical-align: middle; text-align: center; width: 25px;height: 25px; background:red; border-radius:14px;'></a></li>")
	$('li#icono_notifications').before("<li id='enlace_notification'><a href='dashboard'>Notificaciones</a></li>")

// var f=new Date();
// cad=f.getHours()+":"+f.getMinutes()+":"+f.getSeconds(); 


 // $.get(location.protocol + '//' + location.host +"/orders/notification.json", function(p){
	 $.get("/orders/notification.json", function(numNotificaciones){

	          // console.log(numNotificaciones);
			$('li#icono_notifications a').append(numNotificaciones);


	});

	 $.get("/credits/notification.json", function(numNotificacionesCreditos){

		 cant = $('#numNotify').text();
		 cant = parseInt(cant) + numNotificacionesCreditos;
		$('#numNotify').text(cant);		 

	});




// };



});


// window.onload = function()
// {
//   $.get("/robots/" + $("#robot_id").val() + ".json", function(raw_robot){
//     Simulator.raw_robot = raw_robot;
//     Simulator.init();
//   });
// };


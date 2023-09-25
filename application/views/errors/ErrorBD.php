<?php
     include "configuraciones_generales.php";   //Incluimos las funciones generales

    //$encabezado es el HTML header de todas las paginas del sitio
    $encabezado = $header;
  	$menu = $menu_login;
	//$menu es el HTML del footer de todas las paginas del sitio
	$pie = $footer;
	
	$cuerpo='<br>

			<div class="alert alert-danger  container-fluid col-xs-10 col-xs-offset-1">
				<br>
				<h2>Error al conectar con la Base de Datos</h2>				
				<br>
			</div>
			
			<br>
			<br>
			';
					
	echo $encabezado.$menu.$cuerpo.$pie;
?>
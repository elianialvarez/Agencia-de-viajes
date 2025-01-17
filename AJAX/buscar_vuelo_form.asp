<!-- #include file=conexion.asp -->
<html>
<head>

  <title>Listado Vuelos por Or&iacute;gen y Destino</title>
  
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      margin: 0;
      padding: 0;
    }

    header {
      background-color: #333;
      color: #fff;
      padding: 1rem;
    }

    header h1 {
      margin: 0;
    }

    nav ul {
      list-style: none;
      padding: 0;
    }

    nav ul li {
      display: inline;
      margin-right: 20px;
    }

    nav ul li a {
      color: #fff;
      text-decoration: none;
    }

    main {
      padding: 20px;
    }

  </style>
	
	
  <script type="text/javascript">

    function AJAXCrearObjeto(){
    
       var obj;
     
       if (window.XMLHttpRequest) { 
      
          obj = new XMLHttpRequest();
      } 
      
      else { 
      
         try {
         
           obj = new ActiveXObject("Microsoft.XMLHTTP");
	   // alert('El navegador utilizado es IE');
         }
         catch (e) {
           
           // alert('El navegador utilizado no está soportado');
          }
      }

      //alert('realizado');
      return obj;
   }
	
	
	

   function leerDatos(){

   

     
     if (oXML.readyState == 4) {
		

        var xml = oXML.responseXML.documentElement;
		

        var tabla = document.getElementById('tabla_vuelos');
        
        // Vaciamos el DIV
	  var definicion_tabla = new String("");

        // cadena con los datos para crear la tabla

          definicion_tabla ='<th>Id Vuelo</th><th>ID Ciudad Origen</th><th>ID Ciudad Destino</th><th>Fecha</th><th>Compa&ntilde;&iacute;a</th><th>Plazas Disponibles</th><th>Duraci&oacute;n</th><th>ID Avi&oacute;n</th><th>Avi&oacute;n</th><th>Precio</th><th>Reservar</th><tr>';
          


         // Iteramos cada vuelo

          var v;
	      var item;

		  
		  for (i = 0; i < xml.getElementsByTagName('vuelo').length; i++){
	    
             // Accedemos al objeto XML 

             item = xml.getElementsByTagName('vuelo')[i];


           

 	        // Recuperamos el identificador de vuelo

                 idVuelo = item.getElementsByTagName('idvuelo')[0].firstChild.data;
 	             
				 
		// Añadimos el campo a la tabla
				 
		definicion_tabla =definicion_tabla+'<td>'+ idVuelo +'</td>';
            
             
          


           // Recuperamos el id de la ciudad de origen

            v = item.getElementsByTagName('ciudad_origen')[0].firstChild.data;

           // Añadimos el campo a la tabla

            definicion_tabla =definicion_tabla+'<td>'+ v +'</td>';


           // Recuperamos el id de la ciudad destino

            v = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;

           // Añadimos el campo a la tabla

            definicion_tabla= definicion_tabla+'<td>' + v +'</td>';

	    // Recuperamos la fecha

            v = item.getElementsByTagName('fecha')[0].firstChild.data;

           // Añadimos el campo a la tabla

            definicion_tabla= definicion_tabla+'<td>' + v + '</td>';


           // Recuperamos la compania

            v = item.getElementsByTagName('compania')[0].firstChild.data;

           // Añadimos el campo a la tabla

            definicion_tabla= definicion_tabla+'<td>' + v + '</td>';

           // Recuperamos el numero de planzas disponibles

            v = item.getElementsByTagName('n_plazas_disponibles')[0].firstChild.data;

           // Añadimos el campo a la tabla

            definicion_tabla= definicion_tabla+'<td>' + v + '</td>';

            // Recuperamos la duracion del vuelo

            v = item.getElementsByTagName('duracion')[0].firstChild.data;

           // Añadimos el campo a la tabla

            definicion_tabla= definicion_tabla+'<td>' + v + '</td>';


            // Recuperamos el id de avion

            v = item.getElementsByTagName('idavion')[0].firstChild.data;

           // añadimo el campo a la tabla

            definicion_tabla= definicion_tabla+'<td>' + v + '</td>';

	   // Recuperamos el avion

            v = item.getElementsByTagName('avion')[0].firstChild.data;

           // añadimo el campo a la tabla

            definicion_tabla= definicion_tabla+'<td>' + v + '</td>';

	  // Recuperamos el precio

            v = item.getElementsByTagName('precio')[0].firstChild.data;

           // añadimo el campo a la tabla

            definicion_tabla= definicion_tabla+'<td>' + v + '</td>';

	   //boton de reserva
	    v = "<a href='reserva_ida_form.asp?id=" + idVuelo + "' class='btn btn-primary'>Reservar</a>";
	    definicion_tabla= definicion_tabla+'<td>' + v + '</td></tr>';
		
	
        }
        // rellenamos el objeto html tabla con la definicion construida

        tabla.innerHTML = definicion_tabla;
         
      }

	if (oXML.readyState == 4) {
        var xml = oXML.responseXML.documentElement;
        var selectDestino = document.getElementById('destino');
        selectDestino.innerHTML = '<option value="0">Todos los destinos</option>';
        var destinos = [];

        for (var i = 0; i < xml.getElementsByTagName('vuelo').length; i++) {
            var item = xml.getElementsByTagName('vuelo')[i];
            var ciudadDestino = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;

            // Verificar si el destino ya está en la lista
            if (!destinos.includes(ciudadDestino)) {
                destinos.push(ciudadDestino); // Agregar a la lista de destinos únicos
                var option = document.createElement('option');
                option.value = ciudadDestino;
                option.text = ciudadDestino;
                selectDestino.appendChild(option);
            }
        }
    }
       

  }
	

	
	function mostrar_vuelos(){


	 var table = document.getElementById("tabla_vuelos");
    
    // Eliminar todas las filas excepto la primera (encabezados)
    while (table.rows.length > 1) {
        table.deleteRow(1);
    }

	 var valorx=document.getElementById("origen").value;
	 var valory=document.getElementById("destino").value;

     // crea el objeto httprequest 

     oXML = AJAXCrearObjeto();
     oXML.open('POST', 'consulta.asp');
     oXML.onreadystatechange = leerDatos;

     oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

     // lanza la peticion enviando los parametros 

     oXML.send('origen='+valorx+'&destino='+valory);
	}

    
   </script>	
	
</head>

<body>
<header>
    <h1>Agencia de Viajes</h1>
    <nav>
      <ul>
        <li><a href="login.html">Login</a></li>
        <li><a href="listar_ciudades.asp">Ciudades</a></li>
        <li><a href="listado_aviones.asp">Aviones</a></li>
        <li><a href="buscar_vuelo_form.asp">Vuelos</a></li>
        <li><a href="consultar_reserva_form.asp">Consultar Reserva</a></li>
 	<li><a href="cerrar_sesion.asp">Cerrar Sesion</a></li>
      </ul>
    </nav>
  </header>
  <main>
<h2>LISTAR VUELOS POR OR&Iacute;GEN Y DESTINO</h2>


<p>Seleccione una ciudad de Or&iacute;gen y de Destino: </p>

<form name="formulario" method="post">
<select name="origen" id="origen" onChange="return mostrar_vuelos()">
<option value="0">Todos los or&iacute;genes</option>
<%
Set origen = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD where IDCIUDAD IN (SELECT IDCIUDADORIGEN FROM VUELO) order by CIUDAD")
do while not origen.EOF
	Response.Write("<option value='" & origen("CIUDAD") & "'>" & origen("CIUDAD") & "</option>")
	origen.MoveNext
loop

%>
</select>

<select name="destino" id="destino" onChange="return mostrar_vuelos()">
    <option value="0">Todos los destinos</option>
</select>
</form>


<table id="tabla_vuelos" name="tabla_vuelos" border=1> 
     </table>
</main>

</body>
<footer>
  <p>&copy; 2024 Agencia de Viajes</p>
</footer>
</html>
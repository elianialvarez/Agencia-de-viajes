<!-- #include file=conexion.asp -->
<!-- #include file=seguridad.asp -->
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Consulta de Vuelos</title>
  
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
<%
Dim id_recibido
id_recibido = Request.QueryString("id")
Dim consulta
Set consulta = Conexion.Execute("select IDCIUDAD, CIUDAD, TASA_AEROPUERTO from CIUDAD where IDCIUDAD=" & id_recibido)
id=consulta("IDCIUDAD")
ciudad=consulta("CIUDAD")
tasa=consulta("TASA_AEROPUERTO")
%>
<form name="formulario_1" action="actualizar_ciudad_final.asp" method="post">
<table>
<tr><td>C&oacute;digo Ciudad:</td>
<td><input type=text name=idciudad readonly value=<% response.write(id) %>></td></tr>
<tr><td>Ciudad:</td><td><input type=text name=ciudad value="<% response.write(ciudad) %>"></td></tr>
<tr><td>Tasa Aeropuerto:</td><td><input type=text name=tasa_aeropuertovalue=<% response.write(tasa) %>></td></tr>
<tr><td><input type="submit" id="actualizar" value="Actualizar"/></td></tr>
</table>
</form>


<button onclick="window.location.href='insertar_ciudad_formulario.asp'">Insertar una ciudad</button>
<button onclick="window.location.href='eliminar_ciudad_form.asp'">Eliminar una ciudad</button>

<%
Conexion.Close
Set Conexion = nothing
%>

</main>



</body>


<footer>
  <p>&copy; 2024 Agencia de Viajes</p>
</footer>
</html>
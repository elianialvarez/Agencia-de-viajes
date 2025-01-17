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
Set consulta = Conexion.Execute("select IDAVION,AVION,N_PLAZAS,PRECIO_BASE from AVION where IDAVION=" & id_recibido)
id=consulta("IDAVION")
avion=consulta("AVION")
plazas=consulta("N_PLAZAS")
precio=consulta("PRECIO_BASE")

%>
<form name="formulario_1" action="actualizar_avion_final.asp" method="post">
<table>
<tr><td>C&oacute;digo Avion:</td>
<td><input type=text name=idavion readonly value=<% response.write(id) %>></td></tr>
<tr><td>Avion:</td><td><input type=text name=avion value="<% response.write(avion) %>"></td></tr>
<tr><td>Plazas:</td><td><input type=text name=n_plazas value=<% response.write(plazas) %>></td></tr>
<tr><td>Precio base:</td><td><input type=text name=precio value=<% response.write(precio) %>></td></tr>
<tr><td colspan="2"><center><input type="submit" id="actualizar" value="Actualizar"/></center></td></tr>
</table>
</form>

<button onclick="window.location.href='insertar_avion_formulario.asp'">Insertar un avi&oacute;n</button>
<button onclick="window.location.href='eliminar_avion_form.asp'">Eliminar un avi&oacute;n</button>

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
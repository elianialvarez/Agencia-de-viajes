<!-- #include file=conexion.asp -->
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
id_recibido = Request.QueryString("id")
Set consulta = Conexion.Execute("SELECT IDRESERVA, APELLIDOS, NOMBRE, IDVUELO, CANCELADO FROM RESERVA WHERE IDRESERVA=" & id_recibido)
id = consulta("IDRESERVA")
apellidos = consulta("APELLIDOS")
nombre = consulta("NOMBRE")
idvuelo = consulta("IDVUELO")
cancelado = consulta("CANCELADO")

%>

<form name="formulario_1" action="cancelar_reserva.asp" method="post">
<table>
<tr><td>C&oacute;digo Reserva:</td><td><input type=text name=idreserva readonly value=<% response.write(id) %>></td></tr>
<tr><td>Apellidos:</td><td><input type=text name=apellidos readonly value="<% response.write(apellidos) %>" ></td></tr>
<tr><td>Nombre:</td><td><input type=text name=nombre readonly value="<% response.write(nombre) %>"></td></tr>
<tr><td>ID Vuelo:</td><td><input type=text name=id_vuelo readonly value=<% response.write(idvuelo) %>></td></tr><tr><td>ID Vuelo:</td><td>
<select name=cancelado><option value=0>No Cancelado</option><option value=1>Cancelado</option></select></td></tr>
<tr><td><input type="submit" id="actualizar" value="Actualizar"/></td></tr>
</table>

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
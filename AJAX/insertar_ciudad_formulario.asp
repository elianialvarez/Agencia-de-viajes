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

<form name="formulario_1" action="insertar_ciudad.asp" method="post">
<table>
<%
Set consulta = Conexion.Execute("select max(IDCIUDAD) as ultimo_id from CIUDAD")
sig_id = consulta("ultimo_id") + 1
%>

<tr><td>C&oacute;digo Ciudad:</td><td><input type=text name=idciudad readonly value=<% response.write(sig_id) %> ></td></tr>
<tr><td>Ciudad:</td><td><input type=text name=ciudad></td></tr>
<tr><td>Tasa Aeropuerto:</td><td><input type=text name=tasa_aeropuerto></td></tr>
<tr><td colspan=2><center><input type=submit name=introducir_ciudad value="Introducir Ciudad"/></center></td></tr>
</table>
</form>

</main>



</body>


<footer>
  <p>&copy; 2024 Agencia de Viajes</p>
</footer>
</html>
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
<table border=1>
<%

Set aviones = Conexion.Execute("SELECT IDAVION, AVION, N_PLAZAS, PRECIO_BASE FROM AVION")

Response.Write "<tr><th>IDAVION</th><th>AVION</th><th>PLAZAS</th><th>PRECIO BASE</th></tr>"

do while not aviones.EOF
    Response.Write "<tr>"
    Response.Write "<td>" & aviones("IDAVION") & "</td>"
    Response.Write "<td><a href=actualizar_avion.asp?id=" & aviones("IDAVION") & ">" & aviones("AVION") & "</a></td>"
    Response.Write "<td>" & aviones("N_PLAZAS") & "</td>"
    Response.Write "<td>" & aviones("PRECIO_BASE") & "</td>"
    Response.Write "</tr>"
    aviones.MoveNext
Loop

Conexion.Close
Set Conexion = nothing
%>
</table>

</main>



</body>


<footer>
  <p>&copy; 2024 Agencia de Viajes</p>
</footer>
</html>



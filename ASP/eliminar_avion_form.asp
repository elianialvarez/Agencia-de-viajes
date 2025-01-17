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
<table border=1><tr><td><b>ELIMINAR</b></td><td><b>AVION</b></td><td><b>PLAZAS</b></td><td><b>PRECIO BASE</b></td></tr>
<%
Set resultado = Conexion.Execute("select IDAVION,AVION,N_PLAZAS,PRECIO_BASE from AVION")
do while not resultado.EOF

Response.Write("<tr><td><center><a href=eliminar_avion.asp?id=" & resultado("IDAVION") & " ><b><font color=red>X</font></b></a></center></td><td> " & resultado("AVION") & " </td><td><center>" & resultado("N_PLAZAS") &"</center></td><td><center>" & resultado("PRECIO_BASE") &"</center></td></tr>")

resultado.MoveNext
loop

%>
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
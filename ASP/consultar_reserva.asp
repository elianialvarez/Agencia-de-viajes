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
<table border="1">
<%
idreserva=request.form("idreserva")
dni=request.form("dni")

Set reservas = Conexion.Execute("SELECT IDRESERVA,APELLIDOS,NOMBRE,NIF,IDVUELO,N_ASIENTOS,CANCELADO FROM RESERVA WHERE IDRESERVA=" & idreserva & "AND NIF=" & dni)

Response.Write "<tr><th>IDRESERVA</th><th>APELLIDOS</th><th>NOMBRE</th><th>NIF</th><th>ID VUELO</th><th>ASIENTOS</th><th>CANCELADO</th><th>CANCELAR</th></tr>"

do while not reservas.EOF
    Response.Write "<tr>"
    Response.Write "<td>" & reservas("IDRESERVA") & "</td>"
    Response.Write "<td>" & reservas("APELLIDOS") & "</td>"
    Response.Write "<td>" & reservas("NOMBRE") & "</td>"
    Response.Write "<td>" & reservas("NIF") & "</td>"
    Response.Write "<td>" & reservas("IDVUELO") & "</td>"
    Response.Write "<td>" & reservas("N_ASIENTOS") & "</td>"
    Response.Write "<td>" & reservas("CANCELADO") & "</td>"
    Response.Write "<td><center><a href='cancelar_reserva_form2.asp?id=" & reservas("IDRESERVA") &"'><b><font color=red>X</font></b></a></center></td>"
    Response.Write "</tr>"
    reservas.MoveNext
Loop

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
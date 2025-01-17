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
idreserva=request.form("idreserva")
idvuelo=request.form("idvuelo")
nombre=request.form("nombre")
apellidos=request.form("apellidos")
dni=request.form("dni")
asientos=request.form("asientos")

SentenciaSQL = "INSERT INTO RESERVA VALUES (" & idreserva & ", '" & apellidos & "', '" & nombre & "', '" & dni & "', '" & idvuelo & "', '" & asientos & "', '" & 0 & "')"

on Error Resume Next
Set rs = Conexion.Execute(SentenciaSQL)

if Conexion.Errors.Count>0 then
	for each error in Conexion.Errors
		response.write(Error.Number & " = " & Error.Description)
	next
else
	response.write("La reserva se ha realizado con &eacute;xito en la Base de Datos")
	Response.Write("</br></br>")
	response.write("Si hace clic en el siguiente bot&oacute;n, se le mostrarán las opciones de aviones de vuelta")
	Response.Write("</br></br>")
	Set vuelos = Conexion.Execute("SELECT IDCIUDADORIGEN, IDCIUDADDESTINO FROM VUELO WHERE IDVUELO=" & idvuelo)
%>
	<form id="Form" action="buscar_vuelo.asp" method="post">
		<div style="display:none;">
    		<input type="text" name="origen" value=<%response.write(vuelos("IDCIUDADDESTINO"))%> />
    		<input type="text" name="destino" value=<%response.write(vuelos("IDCIUDADORIGEN"))%> />
		</div>
    		<input type="submit" value="Reservar vuelta" />
	</form>
<%

end if

Conexion.Close
Set Conexion = nothing
%>

</main>



</body>


<footer>
  <p>&copy; 2024 Agencia de Viajes</p>
</footer>
</html>
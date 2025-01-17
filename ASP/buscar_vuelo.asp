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

ciudadOrigen = Request.Form("origen")
ciudadDestino = Request.Form("destino")

if ciudadOrigen = "0" and ciudadDestino = "0" then
	Set vuelos = Conexion.Execute("SELECT IDVUELO, CIUDAD_ORIGEN, CIUDAD_DESTINO, FECHA, COMPANIA, IDAVION, AVION, DURACION, N_PLAZAS_DISPONIBLES, PRECIO FROM LISTA_VUELOS_PRECIO")
ElseIf ciudadOrigen = "0" then
	Set vuelos = Conexion.Execute("SELECT IDVUELO, CIUDAD_ORIGEN, CIUDAD_DESTINO, FECHA, COMPANIA, IDAVION, AVION, DURACION, N_PLAZAS_DISPONIBLES, PRECIO FROM LISTA_VUELOS_PRECIO WHERE CIUDAD_DESTINO = '" & ciudadDestino & "'")
ElseIf ciudadDestino = "0" then
	Set vuelos = Conexion.Execute("SELECT IDVUELO, CIUDAD_ORIGEN, CIUDAD_DESTINO, FECHA, COMPANIA, IDAVION, AVION, DURACION, N_PLAZAS_DISPONIBLES, PRECIO FROM LISTA_VUELOS_PRECIO WHERE CIUDAD_ORIGEN = '" & ciudadOrigen & "'")
Else
	Set vuelos = Conexion.Execute("SELECT IDVUELO, CIUDAD_ORIGEN, CIUDAD_DESTINO, FECHA, COMPANIA, IDAVION, AVION, DURACION, N_PLAZAS_DISPONIBLES, PRECIO FROM LISTA_VUELOS_PRECIO WHERE CIUDAD_DESTINO = '" & ciudadDestino & "' AND CIUDAD_ORIGEN = '" & ciudadOrigen & "'")
End If

Response.Write "<tr><th>IDVUELO</th><th>IDCIUDAD ORIGEN</th><th>IDCIUDAD DESTINO</th><th>FECHA</th><th>IDCOMPANIA</th><th>IDAVION</th><th>AVION</th><th>DURACION</th><th>PLAZAS DISPONIBLES</th><th>PRECIO</th><th>RESERVAR</th></tr>"

do while not vuelos.EOF
    Response.Write "<tr>"
    Response.Write "<td>" & vuelos("IDVUELO") & "</td>"
    Response.Write "<td>" & vuelos("CIUDAD_ORIGEN") & "</td>"
    Response.Write "<td>" & vuelos("CIUDAD_DESTINO") & "</td>"
    Response.Write "<td>" & vuelos("FECHA") & "</td>"
    Response.Write "<td>" & vuelos("COMPANIA") & "</td>"
    Response.Write "<td>" & vuelos("IDAVION") & "</td>"
    Response.Write "<td>" & vuelos("AVION") & "</td>"
    Response.Write "<td>" & vuelos("DURACION") & "</td>"
    Response.Write "<td>" & vuelos("N_PLAZAS_DISPONIBLES") & "</td>"
    Response.Write "<td>" & vuelos("PRECIO") & "</td>"

    Response.Write "<td> <button onclick=""window.location.href='reserva_ida_form.asp?id=" & vuelos("IDVUELO") & "'"">Reservar</button> </td>"
    Response.Write "</tr>"
    
    vuelos.MoveNext
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
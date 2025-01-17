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
idreserva = Request.Form("idreserva")
cancelado = Request.Form("cancelado")

SentenciaSQL = "UPDATE RESERVA SET CANCELADO='" & cancelado & "' WHERE IDRESERVA=" & idreserva

On Error Resume Next
Set rs = Conexion.Execute(SentenciaSQL)

If Conexion.Errors.Count > 0 Then
    For Each objErr in Conexion.Errors
        Response.Write("<p>")
        Response.Write("Error al Cancelar: ")
        Response.Write(objErr.Description & "</p>")
    Next
ElseIf cacelado=1 then
    Response.Write("Cancelación Exitosa")
ElseIf cancelado=0 then
	Response.Write("Descancelación Exitosa")
End If

Conexion.Close
Set Conexion = Nothing
%>

</main>



</body>


<footer>
  <p>&copy; 2024 Agencia de Viajes</p>
</footer>
</html>
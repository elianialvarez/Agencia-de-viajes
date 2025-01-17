
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

<form name="formulario" action="buscar_vuelo.asp" method="post">
<select name="origen" id="origen">
<option value="0">Todos los orígenes</option>
<%
Set origen = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
do while not origen.EOF
	Response.Write("<option value='" & origen("CIUDAD") & "'>" & origen("CIUDAD") & "</option>")
	origen.MoveNext
loop
origen.Close
Set origen = Nothing
%>
</select>
<select name="destino" id="destino">
<option value="0">Todos los destinos</option>
<%
Set destino = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
do while not destino.EOF
	Response.Write("<option value='" & destino("CIUDAD") & "'>" & destino("CIUDAD") & "</option>")
	destino.MoveNext
loop
destino.Close
Set destino = Nothing
%>
</select>
<input type="submit" id="buscar" value="Buscar"/>
</form>

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
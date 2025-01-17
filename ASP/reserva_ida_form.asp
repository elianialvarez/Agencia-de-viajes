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

<form method="post" action="reserva_ida.asp">
<table>
<%
Set consulta = Conexion.Execute("select max(IDRESERVA) as ultimo_id from RESERVA")

siguiente = consulta("ultimo_id") + 1

id_vuelo=request.querystring("id")

Set precio = Conexion.Execute("SELECT PRECIO FROM LISTA_VUELOS_PRECIO WHERE IDVUELO=" & id_vuelo)

precio_vuelo = precio("PRECIO")

%>
<tr><b>VUELO DE IDA</b><br><br></tr>
<tr><td>ID RESERVA: </td><td><input type="text" readonly name="idreserva" value=<% response.write(siguiente) %>></td></tr>
<tr><td>ID VUELO</td><td><input type="text" readonly name="idvuelo" value=<% response.Write(id_vuelo) %> ></td></tr>
<tr><td>Nombre: </td><td><input type="text" name="nombre" required></td></tr>
<tr><td>Apellidos: </td><td><input type="text" name="apellidos" required></td></tr>
<tr><td>DNI: </td><td><input type="text" name="dni" required></td></tr>
<tr><td>Asientos: </td><td><input type="number" name="asientos" id="asientos" min="1" required onchange="calcularTotal()"></td></tr>
<tr><td>Precio por asiento:</td><td><span id="precio_vuelo"><%=precio_vuelo%></span></td></tr>
<tr><td>Total:</td><td><span id="total">0</span></td></tr>

<tr><td><center><input type="submit" id="reservar" value="RESERVAR IDA"/></center></td></tr>

<script type="text/javascript"> 
function calcularTotal() { 
var precioVuelo = <%=precio_vuelo%>; 
var numAsientos = document.querySelector('[name="asientos"]').value; 
var total = precioVuelo * numAsientos; 
document.getElementById("total").innerHTML = total; } 
</script>

</table>
</form>

</main>



</body>


<footer>
  <p>&copy; 2024 Agencia de Viajes</p>
</footer>
</html>


<%@page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,org.firebirdsql.management.*"%>

<html lang="es">
   <head>
      <title>Consulta Reserva</title>
      <meta charset="UTF-8">
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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

<body bgcolor="#CCCCFF" text="#000000">
   <header>
      <h1>Agencia de Viajes</h1>
      <nav>
        <ul>
          <li><a href="login.html">Login</a></li>
          <li><a href="insertar_vueloForm.html">Insertar Vuelo</a></li>
          <li><a href="reservaForm.html">Reservas JSP</a></li>
        </ul>
      </nav>
    </header>
    <main>
<h1>Consultar Reserva</H1>

<%
   String DB_SERVER_URL = "localhost";
   int DB_SERVER_PORT = 3050;

   String DB_PATH = "C:/DAI";

   String DB_NAME = "AGENCIA.FDB";
   String DB_USER = "SYSDBA";
   String DB_PASSWORD = "masterkey";
   String DB_CONNECTION_STRING = "jdbc:firebirdsql:"+DB_SERVER_URL+"/"+DB_SERVER_PORT+":"+DB_PATH+"/"+DB_NAME;

   String dni= request.getParameter("dni");
   String ciudadOrigen= request.getParameter("ciudadOrigen");

   FBManager fbManager = new FBManager();

   fbManager.setServer(DB_SERVER_URL);
   fbManager.setPort(DB_SERVER_PORT);

   fbManager.start();

   Class.forName("org.firebirdsql.jdbc.FBDriver");
%>

<p>Abriendo conexión: <%=DB_CONNECTION_STRING%></p>

<%
   Connection connRSFind = DriverManager.getConnection(DB_CONNECTION_STRING, DB_USER, DB_PASSWORD);
%>

<p>Los parámetros introducidos son: <%=dni%> y <%=ciudadOrigen%><p>

<%
   String sqlString = "SELECT * FROM RESERVA, LISTA_VUELOS_PRECIO WHERE RESERVA.IDVUELO=LISTA_VUELOS_PRECIO.IDVUELO AND  RESERVA.NIF = \'" + dni + "\' AND UPPER(LISTA_VUELOS_PRECIO.CIUDAD_ORIGEN) = \'" + ciudadOrigen.toUpperCase() + "\'";
%>

<p>La cadena SQL es: <%=sqlString%></p>

<%
   PreparedStatement StatementRSFind = null;
   ResultSet RSFind = null;
   boolean resultException = false;
   boolean rsReady = false;

   try{
      StatementRSFind = connRSFind.prepareStatement(sqlString);
      RSFind = StatementRSFind.executeQuery();
      rsReady = RSFind.next();
   }catch(SQLException e1){
      resultException = true;

%>
<p>Error: <%=e1.getMessage()%></p>
<%
}

int i = 0;

if (rsReady){%>
   <table border = 1> 
      <tr> 
         <th>IDRESERVA</th> 
         <th>IDVUELO</th> 
         <th>Apellidos</th> 
         <th>Nombre</th> 
         <th>Ciudad Origen</th> 
         <th>Ciudad Destino</th> 
         <th>Fecha del Vuelo</th> 
         <th>Compañía</th> 
         <th>Estado</th> 
      </tr>
   <%
   boolean done = false;
   while (!done){
      i++;
      String campoIdReserva = RSFind.getString("IDRESERVA");
      String campoIdVuelo = RSFind.getString("IDVUELO");
      String campoApellidos = (String) RSFind.getObject("APELLIDOS");
      String campoNombre = (String) RSFind.getObject("NOMBRE");
      String campoCiudadOrigen = (String) RSFind.getObject("CIUDAD_ORIGEN");
      String campoCiudadDestino = (String) RSFind.getObject("CIUDAD_DESTINO");
      String campoFecha = RSFind.getString("FECHA");
      String campoCompania = (String) RSFind.getObject("COMPANIA");
      String campoEstado = RSFind.getString("CANCELADO");

   %>
<tr> 
   <td><%=campoIdReserva%></td> 
   <td><%=campoIdVuelo%></td> 
   <td><%=campoApellidos%></td> 
   <td><%=campoNombre%></td> 
   <td><%=campoCiudadOrigen%></td> 
   <td><%=campoCiudadDestino%></td> 
   <td><%=campoFecha%></td> 
   <td><%=campoCompania%></td> 
   <td><%=campoEstado%></td> 
</tr>
</table>
<%
   done = !RSFind.next();
} //End while loop

RSFind.close();
}
else{
%>
<p>The result set was empty. Check to be sure database is running and settings in search.jsp are correct.</p>
<%

}
if (StatementRSFind != null)
StatementRSFind.close();

if (connRSFind != null)
connRSFind.close();

%>

</main>

</body>


<footer>
  <p>&copy; 2024 Agencia de Viajes</p>
</footer>
</html>
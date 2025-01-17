<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,org.firebirdsql.management.*,java.text.SimpleDateFormat,java.util.Date"%>
<%@ include file="seguridad.jsp" %>
<html>
   <head>
      <title>insertarVuelos.jsp</title>
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
     
         .empresa, .ubicacion, .imagen-corporativa, .consulta-vuelos {
           margin-bottom: 20px;
         }
     
         .empresa h2, .ubicacion h2, .imagen-corporativa h2, .consulta-vuelos h2 {
           border-bottom: 1px solid #333;
         }
       </style>
   </head>

<body bgcolor="#CCCCFF" text="#000000">
   <header>
      <h1>Agencia de Viajes</h1>
      <nav>
        <ul>
          <li><a href="login.html">Login</a></li>
          <li><a href="insertar_vueloForm.jsp">Insertar Vuelo JSP</a></li>
          <li><a href="reservaForm.html">Reservas JSP</a></li>
        </ul>
      </nav>
    </header>

    <main>
<h1>Insertar Vuelo</H1>

<%
   String DB_SERVER_URL = "localhost";
   int DB_SERVER_PORT = 3050;

   String DB_PATH = "C:/DAI";

   String DB_NAME = "AGENCIA.FDB";
   String DB_USER = "SYSDBA";
   String DB_PASSWORD = "masterkey";
   String DB_CONNECTION_STRING = "jdbc:firebirdsql:"+DB_SERVER_URL+"/"+DB_SERVER_PORT+":"+DB_PATH+"/"+DB_NAME;

   Connection conn = null;
   PreparedStatement statement = null;
   ResultSet rs = null;

   try {
       Class.forName("org.firebirdsql.jdbc.FBDriver");
       conn = DriverManager.getConnection(DB_CONNECTION_STRING, DB_USER, DB_PASSWORD);
       conn.setAutoCommit(false); // Iniciar una transacción

       int idciudad_origen = Integer.parseInt(request.getParameter("ciudad_origen"));
       int idciudad_destino = Integer.parseInt(request.getParameter("ciudad_destino"));
       String fechaStr = request.getParameter("fecha");
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       Date fechaDate = sdf.parse(fechaStr);
       Timestamp fecha = new Timestamp(fechaDate.getTime());
       int idcompania = Integer.parseInt(request.getParameter("compania"));
       int idavion = Integer.parseInt(request.getParameter("idavion"));
       String duracion = request.getParameter("duracion");

       String maxidQuery = "SELECT MAX(IDVUELO) AS maxidvuelo FROM VUELO";
       statement = conn.prepareStatement(maxidQuery);
       rs = statement.executeQuery();
       int nextId = 1;
       if (rs.next()) {
           nextId = rs.getInt("maxidvuelo") + 1;
       }

       String sqlString = "INSERT INTO VUELO (IDVUELO, IDCIUDADORIGEN, IDCIUDADDESTINO, FECHA, IDCOMPANIA, IDAVION, DURACION) VALUES (?, ?, ?, ?, ?, ?, ?)";
       statement = conn.prepareStatement(sqlString);
       statement.setInt(1, nextId);
       statement.setInt(2, idciudad_origen);
       statement.setInt(3, idciudad_destino);
       statement.setTimestamp(4, fecha);
       statement.setInt(5, idcompania);
       statement.setInt(6, idavion);
       statement.setString(7, duracion);

       statement.executeUpdate();
       conn.commit(); // Confirmar la transacción

       out.println("<p>¡Vuelo insertado correctamente!</p>");

   } catch (Exception e) {
       if (conn != null) {
           try {
               conn.rollback(); // Revertir la transacción en caso de error
           } catch (SQLException ex) {
               ex.printStackTrace();
           }
       }
       %>
       <p>Error al insertar el vuelo: " + e.getMessage() + "</p>
       <%
   } finally {
       if (rs != null) {
           rs.close();
       }
       if (statement != null) {
           statement.close();
       }
       if (conn != null) {
           conn.setAutoCommit(true); // Restaurar el modo de autocommit
           conn.close();
       }
   }
%>

</body>
<footer>
  <p>&copy; 2024 Agencia de Viajes</p>
</footer>
</html>
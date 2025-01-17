<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="seguridad.jsp" %>
<html> 
    <html lang="es">
        <title>Insertar Vuelo</title> 
        <meta charset="UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
              padding-left: 50px;
              font-size: large;
            }
        
          </style>
    </head> <body>
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

          
          <main > 
            <h1>Insertar Vuelo</h1>
            <form action="insertarVuelos.jsp" method="post">
                <table>
                    <label for="ciudad_origen">Id Ciudad de Origen:</label><br>
                    <input type="number" id="ciudad_origen" name="ciudad_origen" required><br>

                    <label for="ciudad_destino">Id Ciudad de Destino:</label><br>
                    <input type="number" id="ciudad_destino" name="ciudad_destino" required><br>

                    <label for="fecha">Fecha:</label><br>
                    <input type="date" id="fecha" name="fecha" required><br>

                    <label for="compania">Id Compañía:</label><br>
                    <input type="number" id="compania" name="compania" required><br>

                    <label for="idavion">ID Avión:</label><br>
                    <input type="number" id="idavion" name="idavion" required><br>

                    <label for="duracion">Duración:</label><br>
                    <input type="number" id="duracion" name="duracion" required><br>
                    <br/>
                    <input type="submit" value="Insertar Vuelo">

            </form>
    

    </main>

</body>


<footer>
  <p>&copy; 2024 Agencia de Viajes</p>
</footer>
</html>
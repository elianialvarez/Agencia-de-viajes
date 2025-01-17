<%
Set Conexion=Server.CreateObject("ADODB.Connection")
Conexion.ConnectionString = "Data Source=agencia; USER=SYSDBA; PASSWORD=masterkey"
Conexion.Mode = 1
Conexion.Open

if Err.Description <> "" then
response.write("<b>Error</b>: " & Err.Description & "<br>")
Conexion.Close
Set Conexion = nothing
end if


%>
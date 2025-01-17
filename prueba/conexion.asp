<%
Set Conexion = Server.CreateObject("ADODB.Connection")
Conexion.ConnectionString = "Data
Source=agencia; USER=SYSDBA;
PASSWORD=masterkey"
Conexion.Mode = 1
Conexion.Open
%>
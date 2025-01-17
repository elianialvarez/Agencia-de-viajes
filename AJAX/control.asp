<body>
<% 
    Dim usuario, contrasenya
    usuario = request.querystring("usuario")
    contrasenya = request.querystring("contrasenya")

if usuario="admin" and contrasenya="1234" then
	Session("loginOk") = 1
        Response.Redirect("listar_ciudades.asp")
	
else
	Session("loginOk") = 0
	Response.Redirect("login.html")
	
end if
%>
</body>
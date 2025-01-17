<%
    login=session("loginOk")
    if login <> 1 then
        Response.Redirect("login.html")
    end if
%>

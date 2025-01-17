<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%
    String usuario, contrasenya;
    usuario = request.getParameter("usuario");
    contrasenya = request.getParameter("contrasenya");

    if ("admin".equals(usuario) && "1234".equals(contrasenya)) {
        session.setAttribute("loginOk", 1);
        response.sendRedirect("reservaForm.html");
    } else {
        session.setAttribute("loginOk", 0);
        response.sendRedirect("login.html");
    }
%>
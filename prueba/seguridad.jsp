<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%
    int loginOk = (int) session.getAttribute("loginOk");

    if (loginOk != 1) {
        response.sendRedirect("login.html");
    }
%>
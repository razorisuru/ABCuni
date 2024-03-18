<%-- 
    Document   : logout
    Created on : Feb 28, 2024, 1:31:30 PM
    Author     : iduni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("UN") != null) {
        session.invalidate();
        response.sendRedirect("signin.jsp");
    }
%>
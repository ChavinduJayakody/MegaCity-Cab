<%-- 
    Document   : processSignout
    Created on : Mar 12, 2025, 12:01:45 PM
    Author     : Chavindu Jayakody
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("../../../index.jsp");
%>
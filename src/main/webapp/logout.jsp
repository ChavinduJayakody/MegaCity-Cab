<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get the session (if it exists)
    HttpSession userSession = request.getSession(false);
    if (userSession != null) {
        userSession.invalidate();
    }
    // Redirect to the login page
    response.sendRedirect("login.jsp?success=You have been logged out successfully.");
%>
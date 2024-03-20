<%-- 
    Document   : insert
    Created on : Jan 29, 2024, 11:01:04 AM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="insert" method="POST">
            Id:<input type="id" name="id" /> <br/>
            Name: <input type="name" name="name" /> <br/>
            Gender: <input type="radio" value="male" name="gender" checked="checked" /> Male
            <input type="radio" value="female" name="gender"/> Female
            <br/>
            Dob: <input type="date" name="dob"/> <br/>
            Department:
            <select name="did">
                <c:forEach items="${requestScope.depts}" var="d">
                    <option value="${d.id}">${d.name}</option>
                </c:forEach>
            </select>
            <br/>
            <input type="submit" value="save"/>
        </form>
    </body>
</html>

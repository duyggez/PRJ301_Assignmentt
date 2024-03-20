<%-- 
    Document   : update
    Created on : Jan 29, 2024, 11:17:24 AM
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
        <form action="update" method="POST">
            Id: ${requestScope.student.id}
            <input type="hidden" name="id" value="${requestScope.student.id}" /> <br/>
            Name: <input type="name" name="name" value="${requestScope.student.name}" /> <br/>
            Gender: <input type="radio" 
                           <c:if test="${requestScope.student.gender}">
                               checked="checked"
                           </c:if>
                           value="male" name="gender"  /> Male
            <input type="radio" value="female"
                     <c:if test="${!requestScope.student.gender}">
                               checked="checked"
                           </c:if>
                   name="gender"/> Female
            <br/>
            Dob: <input type="date" name="dob" value="${requestScope.student.dob}"/> <br/>
            Department:
            <select name="did">
                <c:forEach items="${requestScope.depts}" var="d">
                    <option 
                        <c:if test="${d.id eq requestScope.student.dept.id}">
                            selected="selected"
                        </c:if>
                        value="${d.id}">${d.name}</option>
                </c:forEach>
            </select>
            <br/>
            <input type="submit" value="save"/>
        </form>
    </body>
</html>

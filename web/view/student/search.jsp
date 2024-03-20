<%-- 
    Document   : search
    Created on : Jan 31, 2024, 8:26:48 AM
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
        <form id="frmSearch" action="search" method="GET"> 
           Department: <select name="did" onchange="document.getElementById('frmSearch').submit();">
                <option value="0">------All-------</option>
                <c:forEach items="${requestScope.depts}" var="d">
                    <option 
                        <c:if test="${d.id eq param.did}">
                            selected="selected"
                        </c:if>
                        value="${d.id}">${d.name}</option>
                </c:forEach>
            </select>
        </form>
        <table border="1px"> 
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Gender</td>
                <td>Dob</td>
                <td>Department</td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.students}" var="s">
             <tr>
                <td>${s.id}
                    <form id="frmDelete${s.id}" action="delete" method="POST">
                        <input type="hidden" value="${s.id}" name="id"/>
                    </form>
                </td>
                <td>${s.name}</td>
                <td>${s.gender?"male":"female"}</td>
                <td>${s.dob}</td>
                <td>${s.dept.name}</td>
                <td>
                    
                    <input type="button" value="Update"
                           onclick="window.location.href='update?id=${s.id}'"
                           />
                    
                    <input type="button" value="Delete"
                           onclick="deleteStudent(${s.id})"
                           />
                    
                </td>
            </tr>   
            </c:forEach>
        </table>
    </body>
</html>

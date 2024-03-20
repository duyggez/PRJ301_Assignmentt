<%-- 
    Document   : timetable
    Created on : Feb 28, 2024, 8:53:28 AM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Timetable</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        
        th {
    background-color: #d8d8ff; /* Màu xanh tím nhạt */
}

        input[type="date"] {
            padding: 6px;
        }

        input[type="submit"] {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        a {
            text-decoration: none;
            color: #0645AD;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <p>Lecturer: ${sessionScope.username}</p>
    <form action="timetable" method="GET">
        <input type="hidden" name="id" value="${param.id}"/>
        Period: <input type="date" value="${requestScope.from}" name="from"/> - <input value="${requestScope.to}" type="date" name="to"/> 
        <input type="submit" value="Show"/>
    </form>
    <table>
        <tr>
            <th>Period</th>
            <c:forEach items="${requestScope.dates}" var="d">
                <th>${d}</th>
            </c:forEach>
        </tr>
        <c:forEach items="${requestScope.slots}" var="slot">
            <tr>
                <td>${slot.name}</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        <c:forEach items="${requestScope.lessions}" var="les">
                            <c:if test="${d eq les.date and les.slot.id eq slot.id}">
                                ${les.group.name} - ${les.group.subject.name}
                                <a href="att?id=${les.id}"> 
                                    <c:if test="${les.attended}">
                                        Edit
                                    </c:if>
                                    <c:if test="${!les.attended}">
                                        Take
                                    </c:if>     
                                </a>
                            </c:if>
                        </c:forEach>
                    </td>
                </c:forEach>
            </tr>  
        </c:forEach>
    </table>    
</body>
</html
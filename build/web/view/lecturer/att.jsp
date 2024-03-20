 <%-- 
    Document   : att
    Created on : Mar 1, 2024, 11:15:47 AM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>





<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Of Lecturer</title>
        <style>
            /* CSS for table styling */
            table {
                border-collapse: collapse; /* Remove default spacing between table cells */
                width: 100%; /* Set table width to 100% of its container */

            }

            /* Styling for table header */
            .table_header {
                background-color: darkorange; /* Background color orange */
                color: white; /* Text color white */
                border: 1px solid black; /* Solid black border around cells */
                padding: 8px; /* Add padding to th elements */
                text-align: center; /* Center align text */
            }

            /* Styling for table cells */
            td {
                border: 1px solid black; /* Solid black border around cells */
                padding: 8px; /* Add padding to td elements */
                text-align: center; /* Center align text */
            }

            /* Styling for alternate rows */
            tr:nth-child(even) {
                background-color: #f2f2f2; /* Light gray background color for even rows */
            }

            .container {
                display: flex; /* Sử dụng flexbox để căn chỉnh */
                justify-content: space-between; /* Căn đều các phần tử con */
                align-items: center; /* Căn giữa theo chiều dọc */
                padding: 10px; /* Thêm padding để tạo khoảng cách */
                border: 1px solid #ccc; /* Đặt đường viền cho khung */
                padding: 10px; /* Thêm padding để tạo khoảng cách giữa khung và nội dung */
                margin-bottom: 50px; /* Thêm margin để tạo khoảng cách giữa các khung */
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Thêm đổ bóng */
            }
            .title {
                flex-grow: 1; /* Tiêu đề sẽ mở rộng để chiếm hết không gian còn lại */
                text-align: center; /* Căn giữa theo chiều ngang */
            }
            .footer {
                border: 1px solid #ccc; /* Đặt đường viền cho khung */
                padding: 10px; /* Thêm padding để tạo khoảng cách giữa khung và nội dung */
                margin-bottom: 20px; /* Thêm margin để tạo khoảng cách giữa các khung */
                margin-top: 50px;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Thêm đổ bóng */

                
            



            }
        </style>
        <script>
            function logout() {
                window.location.href = "../logout";
            }
        </script>
    </head>


    <body>
        
        
        
        
        <div class="container">
            <img src="../images/FPT_logo.jpg" alt="Logo_FPT" style="width:250px; height: 100px;">
            <h1 class="title">Lecturer's attendance</h1>
           
     
            
            
            <div style="width: 250px; display: flex; ">
                <c:forEach items="${requestScope.lessons}" var="less">
                    <c:if test="${param.id eq less.leID}">
                        <div style="background-color: green; color: white; padding: 5px; margin-right: 10px; border-radius: 5px ">
                            ${less.lecturer.lID} <!-- Hiển thị tên nhóm -->
                        </div>
                        <div style="border-left: 1px solid black; margin-right: 10px;"></div>
                        <input style="background-color: green; color: white; border-radius: 5px;padding: 5px;"  type="button" value="Log out" onclick="logout()">
                    </c:if>
                </c:forEach>

            </div>
        </div>

        <form action="att" method="POST">
            <input type="hidden" name="id" value="${param.id}"/>
            <table border="1px">
                <tr class="table_header" style="color:white">
                    <td style="color:white">NO</td> 
                    <td>CODE</td>
                    <td>NAME</td>
                    <td>IMAGE</td>
                    <td>STATUS</td>
                    <td>COMMENT</td>
                    <td>RECORD TIME</td>
                    <td>TAKER</td>

                </tr>
                <c:set var="count" value="1" scope="page"/><!-- Khởi tạo biến đếm -->
                <c:forEach items="${requestScope.atts}" var="a">

                    <tr>
                        <!-- NO -->
                        <td >
                            ${count}
                        </td>
                        <!-- GROUP -->
                        <c:forEach items="${requestScope.lessons}" var="less">
                            <c:if test="${param.id eq less.leID}">
                                <td>${less.group.gName}</td> <!-- Hiển thị tên nhóm -->
                            </c:if>
                        </c:forEach>

                        <!-- CODE -->
                        <td>${a.student.id}</td>
                        <!-- NAME -->
                        <td>${a.student.name}</td>
                        <!-- IMAGE -->   
                        <td>                            
                            <img src="../images/${a.student.id}.jpg" width="140" height="160" alt="${a.student.id}"/>
                        </td>
                        <!-- STATUS -->
                        <td>
                            <input 
                                ${!a.present?"checked=\"checked\"":""}
                                type="radio" value="no" name="present${a.student.id}" /> <p style="color:red">Absent</p>
                            <input type="radio"
                                   ${a.present?"checked=\"checked\"":""}
                                   value="yes" name="present${a.student.id}" style="color: green"/> <p style="color:green">Attendent</p>
                        </td>
                        <!--COMMENT-->
                        <td>
                            <input name="description${a.student.id}" type="text" value="${a.description}"/>
                        </td>
                        <!--TAKER-->
                        <c:forEach items="${requestScope.lessons}" var="less">
                            <c:if test="${param.id eq less.leID}">

                                <td>${less.lecturer.lID}</td> <!-- Hiển thị mã giáo viên -->
                            </c:if>
                        </c:forEach>
                        <!--RECORD TIME-->
                        <td>${a.time}</td>
                    </tr>  
                    <c:set var="count" value="${count + 1}" scope="page"/> <!-- Tăng biến đếm sau mỗi lần lặp -->
                </c:forEach>
            </table>
            <input style="width: 100%; color: white; background-color: darkorange; padding: 10px; font-size: 20px" type="submit" value="Save"/>              
        </form>
        <div class="footer">
            <p style="text-align: center">Mọi góp ý, thắc mắc xin liên hệ: Phòng dịch vụ giáo viên: Email: <b>dichvugiaovien@fe.edu.vn</b>. Điện thoại: (024)7308.13.13</p>
    </body>
</html>

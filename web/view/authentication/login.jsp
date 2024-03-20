<%-- 
    Document   : login
    Created on : Feb 21, 2024, 8:09:41 AM
    Author     : sonnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đại học FPT Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            max-width: 100%; /* Giới hạn chiều rộng tối đa của container */
            max-height: 70vh; /* Giới hạn chiều cao tối đa của container, 70% chiều cao của viewport */
            text-align: center; /* Canh chỉnh ảnh giữa container */
            background-image: url('https://hanoi.fpt.edu.vn/wp-content/uploads/2022/09/z3725377487091_98c8d5c0f83534192eb95180a9be2dd1-scaled.jpg');
            background-size: cover;




            background-position: center;
            background-repeat: no-repeat;
        }

        .login-container {
    background-color: #F65B00;
    color: #000;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-top: 250px;
}


        .login-container form {
            max-width: 300px;
            margin: 0 auto;
         
            
        }

        .login-container input[type="text"],
        .login-container input[type="password"],
        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        .login-container input[type="submit"] {
            background-color: #0C4DA2; 
            color: white;
            border: none;
            cursor: pointer;
        }

        .login-container input[type="submit"]:hover {
            background-color: #073D84; 

        .login-container input[type="checkbox"] {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="POST">
            <label for="username">Username:</label><br/>
            <input type="text" id="username" name="username"/><br/><br/>
            <label for="password">Password:</label><br/>            
            <input type="password" id="password" name="password"/><br/><br/>
            <input type="checkbox" id="remember" name="remember"/>
            <label for="remember">Remember me</label><br/><br/>
            <input type="submit" value="Login"/>
        </form>
    </div>
</body>
</html>




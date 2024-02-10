<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('assets/fd0c9376e8c15097b446b32177a32cfb.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center top;
            height: 100vh;
        }

        nav {
            overflow: hidden;
            padding: 10px;
        }

        nav a {
            float: right;
            display: block;
            color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            background-color: white;
            margin-right: 20px;
            border-radius: 5px;
        }

        nav a:hover {
            background-color: #ddd;
            color: black;
        }

        .welcome-message {
            color: white;
            margin-left: 20px;
            font-size: 34px;
            display: none;
        }
    </style>
</head>
<body>

<nav>
   <a href="AboutUs.jsp" style="margin-left: 8px; width: 90px;">About</a>
<a href="login.jsp" style="margin-left: 8px; width: 90px;">Login</a>
<a href="contact.jsp" style="margin-left: 8px; width: 90px;">Contact</a>
<a href="service.jsp" style="margin-left: 8px; width: 90px;">Service</a>
<a href="index.jsp" style="margin-left: 8px; width: 90px;">Home</a>

</nav>

<div class="welcome-message">
    <h1>Welcome to Trading Platform</h1>
</div>

<script>
    var currentPage = window.location.href;

    if (currentPage.endsWith("index.jsp")) {
        document.querySelector(".welcome-message").style.display = "block";
    }
</script>

</body>
</html>
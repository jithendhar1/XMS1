<%@page import="DAO.CustomerDAO"%>
<%@page import="beans.CustomerBean"%>
<%@page import="DAO.ReffertalDAO"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="srv.RandomAccountIDGenerator"%>
<%
HttpSession sessionn = request.getSession();
    // Getting the username from the session
    String username = (String)session.getAttribute("username");
String ReferredUserID = request.getParameter("userid");
List<CustomerBean> deptt = ReffertalDAO.getAllEmployees();

// Check if ReferredUserID has a value
boolean isReferredUser = (ReferredUserID != null && !ReferredUserID.isEmpty());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr - Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Registration</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/tstyles.css">

      <style>
       
       .form-container {
    width: 90%;
    max-width: 800px; /* You can adjust the max-width as needed */
    margin: 0 auto; /* Center the form horizontally */
    height: 76vh;
    border: 2px solid black;
    border-radius: 10px;
    background-color: #fff;
    padding: 18px;

       }
.custom-logo {
    position: absolute;
    top: 10px;
    left: 10px;
}

.custom-logo a {
    display: block;
}

.custom-logo img {
    width: 100px;
}

.account-wrapper {
   
    align-items: center;
    justify-content: center;
    height: 66vh;
     padding:5px;
}

.account-box {
  width: 38vw;
  height:86vh;
}
.btn-success {
    background-color: #ff5e74;
    }

    </style>
</head>
<body>

 <jsp:include page="index.jsp" />
        <div class="account-content"> 
            <div class="container">
                 <div  class="custom-logo">
                    <a><img style="width:75px;" src="assets/WhatsApp Image 2024-01-29 at 19.01.35_802bac3a.jpg" alt="Company Logo"></a>
                </div>
<div class="account-box">
                    <div class="account-wrapper">
                        <h3 class="account-title"> Registration</h3>
   
     
    <form action="./AddUser" method="post" class="form-container col-md-6">
        <div class="row">
        <div class="col-md-6">
                <div class="form-group">
                    <label>User ID<span class="text-danger">*</span></label>
                    <%
                            String randomAccountID = RandomAccountIDGenerator.generateRandomAccountID();
                        %>
                    <input name="userID" readonly class="form-control" type="text" value="<%= randomAccountID %>">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>User Name <span class="text-danger">*</span></label>
                    <input required name="username" class="form-control" type="text">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label>First Name <span class="text-danger">*</span></label>
                    <input required name="firstname" class="form-control" type="text">
                </div>
            </div>
           
           <div class="col-md-6">
                <div class="form-group">
                    <label>Last Name <span class="text-danger">*</span></label>
                    <input required name="lastname" class="form-control" type="text">
                </div>
            </div>
 
           <div class="col-md-6">
                <div class="form-group">
                    <label>Email <span class="text-danger">*</span></label>
                    <input required name="email" class="form-control" type="text">
                    <font color="red"><%= request.getAttribute("warningMessage") %></font>
                </div>
            </div>
           
           <div class="col-md-6">
                <div class="form-group">
                    <label>Phone Number <span class="text-danger">*</span></label>
                    <input required name="phno" class="form-control" type="text">
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="form-group">
                    <label>Password<span class="text-danger">*</span></label>
                    <input required name="password" id="password" type="password" class="form-control">
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="form-group">
                    <label>Confirm Password<span class="text-danger">*</span></label>
                    <input required name="confirm_pass" id="confirm_pass" type="password" class="form-control">
                </div>
            </div>
            <span id="passwordError" style="color: red;"></span>
            
   <% if (ReferredUserID != null) { %>
    <div class="col-md-6">
        <div class="form-group">
            <label>referral<span class="text-danger">*</span></label>
            
            <select id="selectedEmployee" name="ReferrerUserID" class="form-control">
                <% 
                    List<CustomerBean> dept = ReffertalDAO.getAllEmployees();
                    String Userid = CustomerDAO.getUserIDByUsername(username);
                %>
                <option>Select Name</option>
                <%
                    for (CustomerBean dep : dept) {
                        // If ReferredUserID has a value, auto-select the matching option
                        boolean isSelected = isReferredUser && dep.getUserID().equals(ReferredUserID);
                %>
                        <option value="<%=dep.getUserID()%>" <%= isSelected ? "selected" : "" %>><%= dep.getUsername()%></option>
                <%
                    }
                %>                      
            </select>
        </div>
    </div>
<% } %>

        </div>
        <div class="col-md-6">
            <button style="margin-left: 160px;" type="submit" class="btn btn-success">Register</button>
        </div>
    </form>
</div>
<script>
    // Add an event listener to check password match when the confirm password field changes
    document.getElementById("confirm_pass").addEventListener("input", function () {
        validatePasswordMatch();
    });

    // Function to validate password and confirm password match
    function validatePasswordMatch() {
        var password = document.getElementById("password").value;
        var confirmPass = document.getElementById("confirm_pass").value;
        var errorSpan = document.getElementById("passwordError");

        if (password !== confirmPass) {
            errorSpan.textContent = "Passwords do not match";
        } else {
            errorSpan.textContent = "";
        }
    }
</script>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/app.js"></script>
</div></div></div>
</body>
</html>

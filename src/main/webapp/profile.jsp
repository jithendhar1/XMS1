<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>

<%
HttpSession sdsession = request.getSession(true);

// Retrieve the username attribute from the session
String username = (String) sdsession.getAttribute("username");
String roleIDString = (String) sdsession.getAttribute("RoleID");

// Check if the user is logged in or redirect to the login page
if (roleIDString == null) {
    response.sendRedirect("login.jsp"); // Change "login.jsp" to your actual login page
} else {
    // Rest of your content for the logged-in user
%>
<!DOCTYPE html>
<html lang="en">

 <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Homex - Real Estate Template</title>
		<link rel="shortcut icon" href="images/favicon.ico">
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <!-- <link rel="stylesheet" href="css/font-awesome.min.css"> -->
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="css/line-awesome.min.css">
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="css/select2.min.css">
		
		<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
		
		
		
		
    </head>
<body>

 <form action="EditProfile" method="post">

<div class="main-wrapper">
    
        <!--	Header start  -->
		<jsp:include page="header.jsp" />
        <!--	Header end  -->
        
       <!--	sidebar start  -->
        <jsp:include page="sidebar.jsp" />
		 <!--	sidebar end  -->
		 
		 <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
        
       <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="page-title">Profile</h3>
                            <ul class="breadcrumb">
                              <li class="breadcrumb-item"><a
									href="<%=(username.equals("Admin")) ? "admin_dashboard.jsp" : "user.jsp"%>">Dashboard</a></li>
                                <li class="breadcrumb-item active">Profile</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Other content or form elements can be placed here -->           						
						<!-- Profile Modal -->
							<div class="row">
								<div class="col-md-12">
									<h2>Profile Information</h2>
							</div>
							</div>
						<!-- userID,     ReferrerUsername -->																					
								<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>User Id <span class="text-danger">*</span></label>				
					    				<input type="text" id="userid" name="userid" class="form-control" disabled>					       
									</div>
								</div>
								<div class="col-md-6">
								<div class="form-group">
									<label>First Name <span class="text-danger">*</span></label>				
					    			<input type="text" id="firstname" name="firstname" class="form-control">					       
								</div>
								</div>
							</div>
							<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>Last Name <span class="text-danger">*</span></label>
			       <input type="text" id="lastname" name="lastname" class="form-control">
						</div>
					</div>
					
					<div class="col-md-6">
						<div class="form-group">
							<label>Email<span class="text-danger">*</span></label>
			       <input type="text" id="email" name="email" class="form-control">
						</div>
					</div>
					</div>	
					
					<div class="row">				
					<div class="col-md-6">
						<div class="form-group">
							<label>User Name <span class="text-danger">*</span></label>
			       <input type="text" id="username" name="username" class="form-control">
						</div>
					</div>
										<!-- <div class="col-md-6">
											<div class="form-group">
												<label>Address</label>
												<input type="text" name="address" class="form-control">
											</div>
										</div> -->
										<div class="col-md-6">
											<div class="form-group">
												<label>Phone Number</label>
												<input type="text" id="phone" name="phone" class="form-control">
											</div>
										</div>
										</div>
										<div class="col-md-12 text-center">
										<div class="form-group">
					                <input type="submit" value="Submit" class="btn btn-primary">
					            </div>
					            </div>
								</div>
						</div>        
        <!--	Footer   start-->		
		<jsp:include page="footer.jsp" />
		<!--	Footer   start--> 
    </div>

</form>
<!-- Wrapper End --> 

<!--	Js Link
============================================================--> 



 <script>
		$(document).ready(function () {
	        showProfileDetails();
	    });
		function showProfileDetails() {
	        // Get the selected property ID from the dropdown
	        var username = '<%= session.getAttribute("username") %>';
	        console.log(username);
			console.log("in showpropertydetails");
	        // Make an AJAX request to the server-side endpoint with the selected property ID
	        $.ajax({
	            type: 'GET',
	            url: 'ProfileDetails?username=' + username,
	            dataType: 'json',
	            success: function (data) {
	                // Populate the form fields with the retrieved property details id
	                $('[name="userid"]').val(data.id);
	                $('[name="firstname"]').val(data.firstName);
	                $('[name="lastname"]').val(data.lastName);
	                $('[name="email"]').val(data.email);
	                $('[name="username"]').val(data.userName);	                
	                $('[name="phone"]').val(data.phone);
	                // ... Add more fields as needed ...	
	                // Update the table with property features if available
	                /* updatePropertyFeatures(data.features); */
	            },
	            error: function (error) {
	                console.error('Error fetching property details:', error);
	            }
	        });
	    }
		
		</script>
</body>
</html>

<%
   }
%>



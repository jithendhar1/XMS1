<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Imp.WithdrawalServiceImpl" %>
<%@ page import="beans.TransactionBean" %>
<%@ page import="java.util.List" %>
<%@page import="DAO.WithdrawalDAO"%>
<%@page import="DAO.CustomerDAO"%>
<%
    // Getting the username from the session
    String username = null;
    String uid = request.getParameter("userid");
if (uid != null) {
	String uid2 = CustomerDAO.getUsernameByUserID(uid);
	  username = uid2;
   
} else {
	 username = (String)session.getAttribute("username");
}
   %>
<!DOCTYPE html>
<html lang="en">
    <head>
    <style>
        .button-container {
            text-align: right;
        }
    </style>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Withdrawal</title>
		
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/line-awesome.min.css">
		<link rel="stylesheet" href="css/select2.min.css">
        <link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/tstyles.css">
	
    </head>
    <body>

		<!-- Main Wrapper -->
       <div class="main-wrapper">
    <!-- Main Wrapper -->
   <!-- Header -->
    <!-- Include your header HTML here -->
    <jsp:include page="header.jsp" />

    <jsp:include page="sidebar.jsp" />

    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <!-- Page Content -->
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row align-items-center">
                <div class="col">
							<div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                                Welcome  <%= username%>!
                              </div>
								<h3 class="page-title">Withdrawal</h3>
								 <ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="<%= (username.equals("Admin")) ? "admin_dashboard.jsp" : "user.jsp" %>">Dashboard</a></li>
									<li class="breadcrumb-item active">Withdrawal</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
							<% if (!"Admin".equals(username)) { %>
							<a href="#" class="Addbutton" data-toggle="modal" data-target="#addwithdrawal"><i class="fa fa-plus"></i> Add Withdrawal</a>
							<% } %>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					<!-- Search Filter -->

								<table id="DOWNLOAD">
									<thead>
										<tr>
							
											<th>Transaction ID </th>
									        <th  style="width:160px;">Withdrawal Date</th>
									        <th>Amount</th>
									        <th>userID</th>
									        <th>Status</th>
									      
										</tr>
									</thead>
<%

  List<TransactionBean>  tax = WithdrawalDAO.getWithdrawalsByUsername(username);

for (TransactionBean tasks : tax) {
	 
%>
<tr>
    <td style="width:140px;"><%=tasks.getTransactionID()%></td>
	<td  style="width:170px;"><%=tasks.getTransactiondate()%></td>
    <td><%=tasks.getAmount()%></td>
    <td><%=tasks.getUserID()%></td>
    
    <%
    String status = tasks.getStatus();
    String statusText = "Approved";

    if ("0".equals(status)) {
        statusText = "Pending";
    }
%>
<%if (!"Admin".equals(username)) { %>
    <td><%=statusText%></td>
<%} else{%>
<td>
    <form action="./WithdrawalStatus" method="post" onsubmit="return disableButton()">
    	<input type="hidden" name="WithdrawalTransactionID" value="<%=tasks.getTransactionID()%>">
    	<input type="hidden" name="amount" value="<%=tasks.getAmount()%>" >
    	<input type="hidden" name="userID" value="<%=tasks.getUserID()%>" >
    		<input type="hidden" name="username" value="<%=username%>" >
 
        <button type="submit" name="status" value="1" <% if ("1".equals(status)) { %>disabled<% } %>>Approved</button>
    </form>
    
  
</td>

<%} %>
    
    
 </tr>
<%
}
%>

								</table>
<div class="row justify-content-center align-items-center" id = "flag1">
   
 <div class="button-container">
			<button id="exportToExcelBtn" onclick="exportToExcel()">Export </button>
   <!--  <button onclick="exportToExcel()">Export to Excel</button> -->
   <!--  <button id="downloadPdf">Download PDF</button> -->
      <button onclick="downloadPDF()">Download PDF</button>

   

</div>
							</div>
						</div>
					</div>
				 <jsp:include page="withdrawal_add.jsp" />
	
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/jspdf.min.js"></script>
<script src="js/jspdf.plugin.autotable.min.js"></script>
<script src="js/jspdf.umd.min.js"></script>
<script src="js/html2pdf.bundle.min.js"></script>
<script src="js/FileSaver.min.js"></script>
<script src="js/xlsx.full.min.js"></script>

   <script>
 function exportToExcel() {
            // Check if event listener is added before removing
            var exportButton = document.getElementById('exportToExcelBtn');
            if (exportButton) {
                exportButton.removeEventListener('click', exportToExcel);
                
                // Call TableExport to export the table
                TableExport(document.getElementById('DOWNLOAD'), {
                    headers: true,
                    footers: true,
                    filename: 'transactions',
                    bootstrap: false,
                    position: 'bottom',
                    ignoreRows: null,
                    ignoreCols: null,
                    trimWhitespace: true
                });
                
                // Disable the button to prevent multiple clicks
                exportButton.disabled = true;
            }
        }

   
    </script>
</div>
    </body>
</html>
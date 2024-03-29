<%@page import="srv.RandomAccountIDGenerator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="DAO.CustomerDAO"%>
    <%
    // Getting the username from the session
    String username = (String)session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Leaves - HRMS admin template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    
    <!-- Table styles CSS -->
    <link rel="stylesheet" href="css/tstyles.css">
    

   
    <title>Leave List</title>
</head>
<body>


<form action="./AddDepositSrv" method="post">
<div id="adddeposit" class="modal custom-modal fade" role="dialog">
 <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        
            <div class="modal-header">
                <h5 class="modal-title">Add Deposit</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
            <div class="modal-body">
 
        <!-- <div class="form-group">
            <label for="AccountID">Account ID <span class="text-danger">*</span></label>
            <input id="AccountID" name="AccountID" class="form-control" type="text">    
        </div> -->
         <div class="form-group">
            <label class="col-form-label">OR Code <span class="text-danger">*</span></label>
           <img alt="" src="assets/qr-image-1706267083663.png" style="width: 100px;height: 100px;">
        </div>
        
<div class="form-group">
    <label class="col-form-label">Code Address<span class="text-danger">*</span></label>
    <div class="input-group">
        <input class="form-control" type="text" id="codeAddressInput" readonly value="0x1bed979134d2362296fadd327a0590b39d4d3ee8">
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" onclick="copyCodeAddress()">Copy</button>
        </div>
    </div>
</div>

<script>
    function copyCodeAddress() {
        /* Get the text value from the input field */
        var codeAddressInput = document.getElementById("codeAddressInput");
        codeAddressInput.select();
        codeAddressInput.setSelectionRange(0, 99999); /* For mobile devices */

        /* Copy the text to the clipboard */
        document.execCommand("copy");

        /* Deselect the input field */
        codeAddressInput.setSelectionRange(0, 0);

        /* Optionally, you can provide feedback to the user (e.g., show a tooltip or alert) */
        alert("Code Address copied!");
    }
</script>


                     <div class="form-group">
                        <label for="DepositTransactionID">DepositTransactionID <span class="text-danger">*</span></label>
                        <%-- Use the scriptlet to generate a random account ID --%>
                        <%
                            String randomAccountID = RandomAccountIDGenerator.generateRandomAccountID();
                        %>
                        <input readonly id="DepositTransactionID" name="DepositTransactionID" class="form-control" type="text" value="<%= randomAccountID %>">
                    </div>

   
       <!--  <div class="form-group">
            <label for="DepositDate">DepositDate <span class="text-danger">*</span></label>
            <input id="DepositDate" name="DepositDate" class="form-control" type="date">
        </div> -->
   

    
        <div class="form-group">
            <label class="col-form-label">Amount <span class="text-danger">*</span></label>
            <input name="Amount" required class="form-control" type="text">
        </div>
  
<% String x=  CustomerDAO.getUserIDByUsername( username);
            		
            		
%>
 
  
        <div class="form-group">
            <label class="col-form-label">userID <span class="text-danger">*</span></label>
            <input name="userID" readonly required class="form-control" type="text" value="<%= x %>">
        </div>
        
</div>

 <div class="submit-section">
    <button type="submit" class="btn btn-primary submit-btn">Submit</button>
  </div>
  </div>
        </div>
    </div>
</form>

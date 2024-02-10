<%@page import="DAO.DepositDAO"%>
<%@page import="DAO.WithdrawalDAO"%>
<%@page import="DAO.ReffertalDAO"%>
<%@page import="DAO.CustomerDAO"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.BigDecimal" %>
<%
    // Getting the username from the session
    String username = (String)session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Trading Admin Dashboard">
    <meta name="keywords" content="admin, trading, bootstrap, business, corporate, management, html5, responsive, CRM">
    <meta name="author" content="Your Company Name">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/logo.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="main-wrapper">
   
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
                        <div class="col-sm-12">
                            <!-- Display welcome message -->
                            <div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                                Welcome <%= username %>!
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                                    <span class="dash-widget-icon"><i class="fa fa-users"></i></span>
                                    <div class="dash-widget-info">
                                  
                                        <% int customerCount = CustomerDAO.totalCount(); %>
                                       
                                        <h4><a href="customers.jsp" style="text-decoration: none; color: inherit;">  <%= customerCount %>  
                                        <br><span>Customers</span>
                                        </a></h4>
                                    </div>
                               
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                               
                                    <span class="dash-widget-icon"><i class="fa fa-money"></i></span>
                                    <div class="dash-widget-info">
                                     
                                        <% int totalDeposits = DepositDAO.totalCount();%>
                                        <h4><a href="deposit_user.jsp" style="text-decoration: none; color: inherit;"> <%= totalDeposits %>
                                        <br><span>Total Deposits</span>
                                        </a></h4>
                                    </div>
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                                
                                    <span class="dash-widget-icon"><i class="fa fa-bank"></i></span>
                                    <div class="dash-widget-info">
                                    
                                        <% int totalWithdrawals = WithdrawalDAO.totalCount(); %>
                                        <h4><a href="withdrawal_user.jsp" style="text-decoration: none; color: inherit;">  <%= totalWithdrawals %>
                                      <br><span>Total Withdrawals</span>
                                         </a></h4>
                                    </div>
                              
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                              
                                    <span class="dash-widget-icon"><i class="fa fa-share"></i></span>
                                    <div class="dash-widget-info">
                                      
                                        <%int referralCount = ReffertalDAO.ReferaltotalCount();%>
                                        <h4><a href="referrals_user.jsp" style="text-decoration: none; color: inherit;"> <%= referralCount %>
                                        <br><span>Referrals</span>
                                          </a></h4>
                                    </div>
                               
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                               
                                    <span class="dash-widget-icon"><i class="fa fa-share"></i></span>
                                    <div class="dash-widget-info">
                                      
                                        <%int ReferralBonus = ReffertalDAO.totalCount();%>  
                                        <h4><a href="bonus.jsp" style="text-decoration: none; color: inherit;">  <%=ReferralBonus %>
                                     <br><span>Referral Bonus</span>
                                        </a></h4>
                                    </div>
                           
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
<script src="js/jquery-3.2.1.min.js"></script> 
<script src="js/popper.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.slimscroll.min.js"></script> 

    </body>
</html>
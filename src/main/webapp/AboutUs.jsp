<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="Imp.DepositServiceImpl" %>
<%@ page import="beans.DepositBean" %>
<%@ page import="java.util.List" %>
<%@page import="DAO.TransactionDAO"%>
<%@page import="beans.TransactionBean"%>
<%-- <%
    // Getting the username from the session
    String username = (String)session.getAttribute("username");
%> --%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Report -  template</title>
		
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
    </head>
    <body>
<!-- Main Wrapper -->
    

    <jsp:include page="index.jsp" />
<style>
    body {
        background-image: linear-gradient(to bottom, #ffffff 40%, #ffffff 40%);
                          
        background-size: cover;
        margin: 0; /* Remove default body margin */
        padding: 0; /* Remove default body padding */
        height: 100vh; /* Ensure full viewport height */
    }
     .h2{
            font-family: Georgia,Serif;
            margin-left: 40px;
            font-size: 40px;
        }
    
</style>
                <div class="col">						
         			<h3 style="margin-left:700px;font-size: 35px;" class="page-title">About US </h3>								
				</div>
	<div style="margin-left: 30px;">
        <img alt="" style="width:97%; height: 450px;" src="assets/blue.jpg">
    </div><br>
						
      <br><br><h2 class="h2">Here are the details for XM-S1 AI bot</h2>
    <div style="display: flex; align-items: center;">
        <p style="margin-left: 40px; font-size: 20px;">
            Welcome to our cutting-edge Forex AI Trading Bot, where advanced technology meets the dynamic world of foreign exchange trading! At<br> XM-S1 AI Trading Bot we are dedicated to providing you with a powerful and intelligent solution to enhance your trading experience and maximize <br>your potential for success.
Our XM S1 Forex AI Trading Bot leverages the power of artificial intelligence and machine learning algorithms to analyze vast <br>amounts of market data in real-time.By utilizing sophisticated trading strategies and predictive modeling, our bot is designed to identify profitable trading<br>  opportunities with precision and speed. It continuously adapts and evolves, learning from past trades and market trends to optimize its performance over time.

        </p>
            </div><br><br>

 <h2 class="h2">Key Features and Benefits:</h2><br>
    <div style="display: flex; align-items: center;">
        <p style="margin-left: 50px; font-size:15px;">
1. Advanced Data Analysis: Our AI Trading Bot incorporates cutting-edge algorithms that analyze a wide array of financial indicators,<br> market trends, and historical data to identify potential trading opportunities. By processing vast amounts of information in milliseconds,<br> it can quickly identify patterns and make data-driven predictions.
<br><br>
2. Automated Trading: With our AI Trading Bot, you can automate your trading strategies and eliminate the need for manual execution.<br> The AI bot can execute trades on your behalf, taking advantage of lucrative market conditions 24/5. This ensures that you never miss an <br>opportunity, even when you're away from your trading desk.
<br><br>
3. Risk Management: Our Forex AI Trading Bot integrates robust risk management tools to help protect your investment. It employs<br> intelligent stop-loss orders and risk control mechanisms to minimize potential losses and preserve your capital. Additionally, it can adapt <br>its trading parameters based on market volatility, ensuring a <br>balanced approach to risk management.
<br><br>
4. Real-Time Market Monitoring: Stay updated with the latest market developments through our bot's real-time monitoring capabilities.<br> It continuously scans the market for changes, news events, and economic indicators that may impact currency prices. This enables you <br>to make informed trading decisions based on up-to-date information.
<br><br>
5. Backtesting and Optimization: Before deploying your trading strategies in live markets, our AI bot enables you to backtest and<br> optimize them using historical data. This feature allows you to validate the effectiveness of your strategies and make necessary adjustments,<br> ensuring a higher probability of success.</p><br><br>
        <img alt="" src="assets/One.jpg" style="width: 400px; height:340px; margin-left: 90px;">
    </div>
    
   <br><br><div style="display: flex; flex-direction: row; margin-left: 50px;">

    <!-- First Div -->
    <div style="width: 610px; height: 410px; border-radius: 5px; background-color: black; color: white; margin-right: 20px; display: flex; justify-content: center; align-items: center;">
        <div style="margin: 40px; font-size: 18px; text-align: center;">
            At XM-S1 we believe that the future of Forex trading lies in the fusion of artificial intelligence, machine learning, and human expertise. Our Forex AI Trading Bot combines these elements seamlessly, empowering traders to make smarter, data-driven decisions and achieve greater success in the dynamic world of foreign exchange.

            <br><br><strong>Disclaimer:</strong> Trading in foreign exchange markets involves substantial risks, including the potential loss of invested capital. Past performance is not indicative of future results. It is important to carefully consider your financial situation and consult with a professional advisor before engaging in Forex trading.

            We offer an exceptional opportunity for investors to maximize their profits in the forex market. Here are the key features of our platform:
        </div>
    </div>

    <!-- Second Div -->
    <div style="margin-left:40px;margin-top:80px;">
        <div style="font-size:17px;">
            1) Daily Profits of up to 1%: Our advanced AI-powered algorithm analyzes market trends and executes <br> with precision. Investors can expect to earn daily profits of up to 1% on their investments. With  our <br>cutting-edge technology, you can potentially grow your wealth consistently.

            <br><br>2) Generous Referral Program: We value our users and believe in rewarding them for their support. <br>Through our direct referral program, you can earn a referral bonus of 10% on the investments <br> made by your direct referrals. This means that not only can you benefit from your own investments, <br>but you can also earn additional income by referring others to <br>our platform.
        </div>
    </div>

</div>
<br><br>
<h1 style="margin-left: 580px;">Reward Programme:</h1><br>

<div style="font-size: 25px;margin-left: 670px;">
3000$   150$<br>
5000$   250$<br>
7,000$  350$<br>
10,000$   Star Cruise Trip<br>
15,000$ 750$<br>
</div><br>

<h4>
<div style="margin: 20px;">
Join us today and experience the power of our Forex AI Bot. Our platform is designed to provide you with a seamless and profitable trading experience. Don't miss out on the opportunity to earn consistent profits in the forex market.
Please note that investing in the forex market involves risks, and past performance is not indicative of future results. It is important to conduct thorough research and make informed investment decisions.
</div>


</h4>
<div>
    <h4 style="display: inline-block; margin-right: 10px;">Disclaimer:</h4>
    The information provided is for informational purposes only and should not be considered as financial or investment advice.
</div>



</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Us</title>
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
            position: relative;
        }

        .contact-container {
            background-color: rgba(255, 255, 255, 0.5); /* 50% transparent white background */
            padding: 20px;
            border-radius: 10px;
            width: calc(100% - 45px); /* Increased width by 20px (60px + 20px) */
            height: 280px; /* Increased height by another 20 pixels */
            margin-top: 50px; /* Adjust top margin as needed */
            display: flex; /* Use flexbox to align items horizontally */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }

        .contact-details {
            flex: 1; /* Take remaining space */
            margin-left: 30px;
        }

        .map-container {
            width: 500px; /* Decreased width of the map */
            height: 300px; /* Fixed height of 300px */
            margin-right: 170px; /* Increased right margin */
        }

        .gmap_canvas {
            width: 100%;
            height: 100%;
        }

        .contact-form {
            margin-top: 20px;
            width: 300px; /* Adjusted form width */
            display: flex;
            flex-direction: column;
            margin-right: 50px; /* Adjusted margin */
        }

        .contact-form div {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .contact-form label {
            margin-right: 10px;
        }

        .contact-form input,
        .contact-form textarea {
            padding: 12px; /* Increased padding */
            border-radius: 8px; /* Added border-radius */
            box-sizing: border-box; /* Include padding in width calculation */
            flex: 1; /* Take remaining space */
        }

        .contact-form button {
            padding: 12px; /* Increased padding */
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px; /* Added border-radius */
            cursor: pointer;
            margin-top: 10px; /* Adjusted margin */
        }

    </style>
</head>
<body>
<jsp:include page="index.jsp" />
<div style="margin-top: 300px;" class="contact-container">
    <div class="contact-details">
        <h1 style="margin-left: 20px;">Contact Us</h1>
        <div class="contact-details">
            <br><p><strong>Name:</strong> Mohamad Ali</p>
            <p><strong>Email:</strong> XMS1SUPP@GMAIL.COM</p>
            <p><strong>Company name:</strong> XM-S1</p>
        </div>
    </div>
    <div class="map-container">
        <div class="mapouter">
            <div class="gmap_canvas">
                <iframe width="100%" height="100%" id="gmap_canvas" src="https://maps.google.com/maps?q=Flat%20no%3A%20302%2C%20Raghava%20Towers%2C%20NH-65%2C%20Hafeezpet%2C%20Madeenaguda%2C%20Telangana-5000050.%20HYDERABAD&t=&z=10&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
            </div>
        </div>
    </div>

    <div class="contact-form">
        <form action="./ContactSrv" method="post">
            <div>
                <label for="name">Name:</label>
                <div>
                    <input style="margin-left:10px;" type="text" id="name" name="name" required>
                </div>
            </div>
            <div>
                <label for="mobile">Mobile Number:</label>
                <div>
                    <input style="margin-right: 40px;" type="text" id="mobile" name="mobile" required>
                </div>
            </div>
            <div>
                <label for="email">Email:</label>
                <div>
                    <input style="margin-left:17px;" type="email" id="email" name="email" required>
                </div>
            </div>
            <div>
                <label for="enquiry">Enquiry:</label>
                <div>
                    <textarea style="margin-left:5px;" id="enquiry" name="enquiry" required></textarea>
                </div>
            </div>
            <button type="submit">Submit</button>
        </form>
    </div>
</div>
</body>
</html>

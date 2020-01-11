<!DOCTYPE HTML>
<!--
	Home Seeker by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Home Seeker by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Header -->
			<header id="header">
				<a class="logo" href="index.html">Home Seeker</a>
				
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<h1>Home Seeker</h1>
					<p>If you search a great residence so you are on the right way<br />
					designed by <a href="https://templated.co/">JFS</a> and whole team</p>
				</div>
				<video autoplay loop muted playsinline src="images/banner.mp4"></video>
			</section>

		<!-- Highlights -->
			<section class="wrapper">
				<div class="inner">
					<header class="special">
						<h2>Our Module</h2>
						<p>We provides our customer a great residentual experience </p>
					</header>
					<div class="highlights">
						
						<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","SYSTEM","2526336");
	String qr="select * from landlord";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
	if(rs.next()){
		%>
		<table border="1px"  cellspacing="0">
		<tr>
		<th>FIRST_NAME</th>
		<th>LAST_NAME</th>
		<th>EMAIl</th>
		<th>CONATCT</th>
		<th>ADDRESS</th>
		<th>CITY</th>
		<th colspan="2">ACTION</th>
		</tr>
		<%
		do{
			String fn=rs.getString("first_name");
			String ln=rs.getString("last_name");
			String email=rs.getString("email");
			String cont=rs.getString("contact");
			String add=rs.getString("address");
			String city=rs.getString("city");
			%>
				<tr>
					<td><%=fn %></td>
					<td><%=ln %></td>
					<td><%=email %></td>
					<td><%=cont %></td>
					<td><%=add %></td>
					<td><%=city %></td>
					<td><a href="delete_lreg.jsp?email=<%=email %>">DELETE</a></td>
					
				</tr>
			<%
		}while(rs.next());
		%>
		</table>
		<%
	}
	else{
		RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
		rd.include(request, response);
		%>
		<script>alert("No record Found");</script>
		<%
	}
%>
					</div>
				</div>
			</section>

		<!-- CTA -->
			

		<!-- Testimonials -->
			
		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<div class="content">
						<section>
							<h3>Copy right contents</h3>
							<p> This is an official web application under licensend within JFS.Inc </p>
						</section>
											</div>
					<div class="copyright">
						&copy; JFS.Inc <a href="https://unsplash.co"></a> <a href="https://coverr.co"></a>.
					</div>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>

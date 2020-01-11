<%@page import="java.sql.*" %>
<%
	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
	String qr="select * from user where email=? and password=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, email);
	ps.setString(2, pwd);
	ResultSet rs=ps.executeQuery();
	
	while(rs.next())
	{
		session.setAttribute("id",email);
	response.sendRedirect("UserHome.html");
	}
	
%>	
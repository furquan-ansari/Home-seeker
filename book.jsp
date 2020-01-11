<%@page import="java.sql.*" %>
<%
	String email=(String)session.getAttribute("id");
	String date=request.getParameter("date");
	String reason=request.getParameter("reason");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
	String qr="insert into book values(?,?,?)";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(3, email);
	ps.setString(1, date);
	ps.setString(2, reason);
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("Landlord.html");
	if(i>0){
		
		rd.include(request, response);
		%>
		<%= "Successfully Registerd"%>
		<%
	}
	else{
		
		rd.include(request, response);
		%>
		<%= "Not Registerd"%>
		<%
	}
%>
<%@page import="java.sql.*" %>
<%
	String fn=request.getParameter("fn");
	String ln=request.getParameter("ln");
	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	String cont=request.getParameter("cont");
	String add=request.getParameter("add");
	String city=request.getParameter("city");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","SYSTEM","2526336");
	String qr="insert into Landlord values(?,?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, fn);
	ps.setString(2, ln);
	ps.setString(3, email);
	ps.setString(4, pwd);
	ps.setString(5, cont);
	ps.setString(6, add);
	ps.setString(7, city);
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
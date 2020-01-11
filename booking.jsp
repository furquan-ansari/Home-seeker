<%@page import="java.sql.*" %>
<%
	String em=(String)session.getAttribute("id");	

		Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
	String qr="select * from book where email=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1,em);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		%>
		<table border="1px" align="center">
		<tr>
		
		<th>EMAIL</th>
		<th>DATE</th>
		<th>REASON</th>
		
		<th colspan="2">ACTION</th>
		</tr>
		<%
		do{
			String email=rs.getString("email");
			String date=rs.getString("date");
			String reason=rs.getString("reason");
			
			%>
				<tr>
					<td><%=email %></td>
					<td><%=date %></td>
					<td><%=reason%></td>
					
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
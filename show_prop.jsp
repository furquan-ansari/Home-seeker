<%@page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/homeseeker","root","root");
	String qr="select * from landlord";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
	if(rs.next()){
		%>
		<table border="1px" align="center">
		<tr>
		<th>FIRST_NAME</th>
		<th>LAST NAME</th>
		<th>EMAIL</th>
		<th>CONTACT</th>
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
					<td><%=add%></td>
					<td><%=city%></td>
					
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
<%
	String name=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	if(name.equals("admin") && pwd.equals("12345"))
	{
		response.sendRedirect("AdminHome.html");
	}
	else{
		RequestDispatcher rd=request.getRequestDispatcher("Admin.html");
		rd.include(request, response);
		%>
		<script>alert("Incorrect User Name or Password");</script>
		<%
	}
%>
<%@page import="java.sql.*" %> 
 
<% 
	String id = request.getParameter("id");
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todoslist","root","");
	pst = con.prepareStatement("delete from list where id = ?");
	 pst.setString(1, id);
	pst.executeUpdate();        
%>

<script>
    alert("Deleted Successfully");
    window.location.replace("index.jsp");
</script>

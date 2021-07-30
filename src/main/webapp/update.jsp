<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String desc = request.getParameter("desc");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todoslist","root","");
        pst = con.prepareStatement("update list set title = ?, description = ? where id = ?");
        pst.setString(1, title);
        pst.setString(2, desc);
        pst.setString(3, id);
        pst.executeUpdate();  
        
        %>
        
        <script>   
            alert("Updated Successfully");           
       </script>
    <%             
    }
 
%>

<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
     <title>Update | ToDos-List</title>
</head>
<body>
    <header>
         <nav class="navbar navbar-light bg-light">
	     	<a class="navbar-brand" href="index.jsp">ToDos-List</a>
	     </nav>
	</header>
	<main>
       	 <div class="container" style="max-width: 720px; margin-top: 25px;">
             <h3 class="text-center">Update todo</h3>
             <form  method="POST" action="#" >
           		<%    
                     Connection con;
                     PreparedStatement pst;
                     ResultSet rs;
     
                     Class.forName("com.mysql.jdbc.Driver");
                     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todoslist","root","");
                        
                     String id = request.getParameter("id");
                       
                     pst = con.prepareStatement("select * from list where id = ?");
                     pst.setString(1, id);
                     rs = pst.executeQuery();
                     
                      while(rs.next())
                      {
                 
                 %> 
                  <div class="form-group">
                       <label for="title">Title</label>
                       <input type="text" class="form-control" value="<%= rs.getString("title")%>" id="title" name="title">
                  </div>
                  <div class="form-group">
                       <label for="desc">Description</label>
                       <textarea class="form-control" id="desc" name="desc" rows="3"><%= rs.getString("description")%></textarea>
                  </div>
                  <% }  %>
                  <div>
                       <input type="submit" id="submit" value="Update" name="submit" class="btn btn-sm btn-info" style="width: 100px;">
                       <input type="reset" id="reset" value="Reset" name="reset" class="btn btn-sm btn-warning" style="width: 100px;">
                   	   <a href="index.jsp" style="margin-left: 330px">Click here to go back</a>
                   </div>
             </form>
      	</div>
    </main>
	
</body>
</html>
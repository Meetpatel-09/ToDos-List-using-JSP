<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%
	if(request.getParameter("submit")!=null)
	{
	    String title = request.getParameter("title");
	    String desc = request.getParameter("desc");
	    
	    Connection con;
	    PreparedStatement pst;
	    ResultSet rs;
	    
	    Class.forName("com.mysql.jdbc.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todoslist","root","");
	    pst = con.prepareStatement("insert into list(title,description)values(?,?)");
	    pst.setString(1, title);
	    pst.setString(2, desc);
	    pst.executeUpdate();     
%> 
	<script>   
	    alert("Added Successfully");     
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
     <title>Welcome | ToDos-List</title>
    </head>
    <body>
	    <header>
	          <nav class="navbar navbar-light bg-light">
	               <a class="navbar-brand" href="index.jsp">ToDos-List</a>
	          </nav>
	     </header>
         <main>
         	 <div class="container" style="max-width: 720px; margin-top: 25px;">
               <h3 class="text-center">Add a todo</h3>
                <form  method="POST" action="#" > 
                    <div class="form-group">
                         <label for="title">Title</label>
                         <input type="text" class="form-control" id="title" name="title">
                    </div>
                    <div class="form-group">
                         <label for="desc">Description</label>
                         <textarea class="form-control" id="desc" name="desc" rows="3"></textarea>
                    </div>
                    <div>
                         <input type="submit" id="submit" value="Add" name="submit" class="btn btn-sm btn-success" style="width: 100px;">
                         <input type="reset" id="reset" value="Reset" name="reset" class="btn btn-sm btn-warning" style="width: 100px;">
                     </div>  
               </form>
          	</div>

          	<div class="container" style="max-width: 1280px">
               <h3 class="text-center my-3">Todos List</h3>
               <div class="container mb-3">
               		<%  
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todoslist","root","");
                        
                         String query = "select * from list";
                         Statement st = con.createStatement();
                         
                           rs =  st.executeQuery(query);
                           
                               while(rs.next())
                               {
                                   String id = rs.getString("id");
                    %>
                    <h4><%=rs.getString("title") %></h4>
                    <p><%=rs.getString("description") %></p>
                    <a href="update.jsp?id=<%=id%>" class="btn btn-sm btn-primary">Edit</a>
                    <a href="delete.jsp?id=<%=id%>" class="btn btn-sm btn-danger">Delete</a>
                    <hr />
                    <%
                              }
                    %>
               </div>
          	</div>
     	</main>
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
     	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    </body>
</html>
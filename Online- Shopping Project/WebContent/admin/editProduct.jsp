<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>
<%@ include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
try
{
	String id=request.getParameter("id");
	
	Connection con=ConnectionProvider.getCon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where id='"+id+"'");
	while(rs.next())
	{
	
%>

<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.print(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" required="required">
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" value="<%=rs.getString(3)%>" required="required">
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
<input class="input-style" type="text" name="price" value="<%=rs.getString(4)%>" required="required">
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
<option value="yes">yes</option>
<option value="no">no</option>
</select>
 <hr>
 
</div>
<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
	}
	con.close();
}
catch(Exception e)
{
	System.out.println(e);
}
%>

</body>
<br><br><br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

<body>

  <div class="container bg-blue-300">
      
    <h3 class="text-center pt-10 text-4xl font-bold">List of Users</h3>
    <hr>
    <div class="flex md:flex-row justify-center pt-2">
      <div>
       <a href="${pageContext.servletContext.contextPath}/users/add"><button class="bg-blue-600 px-2 py-2 hover:bg-blue-700 focus:outline-none text-white rounded-sm">Add New User</button></a>
      </div>
      <div class="ml-4">
       <a href="<%=request.getContextPath()%>/"><button class="bg-purple-600 px-2 py-2 hover:bg-purple-700 focus:outline-none text-white rounded-sm">Show All Articles</button></a>
      </div>
    </div>
    <br>
    
    <div class="flex">
    <table class="table table-bordered bg-white shadow-lg">
      <thead>
        <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Email</th>
          <th>Country</th>
          <th>Action</th>
        </tr>
      </thead>
      
      <tbody>
          <c:forEach var="user" items="${users}">
        	<tr>
        	  <td>${user.getId()}</td>
        	  <td>${user.getName()}</td>
        	  <td>${user.getEmail()}</td>
        	  <td>${user.getCountry()}</td>
        	  <td>
        	    <a href="<%=request.getContextPath()%>/users/update/${user.getId()}" style="text-decoration: none;">
        	     <button class="bg-green-600 px-2 py-2 hover:bg-green-700 focus:outline-none text-white rounded-sm">Edit</button>
        	    </a>
        	    &nbsp;&nbsp;
        	    <div class="inline-block">
        	      <form action="<%=request.getContextPath()%>/users/delete/${user.getId()}" method="POST">
        	       <button onclick="return confirm('Do you really want to delete?')" class="bg-red-400 px-2 py-2 hover:bg-red-500 focus:outline-none text-white rounded-sm">Delete</button>
        	      </form>
        	    </div>
        	  </td>
        	</tr>
          </c:forEach>
      </tbody>
    </table>
    </div>
  </div>
  
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User form</title>
</head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

<body>
   <div class="flex container h-screen bg-blue-300">
    <div class="shadow-lg mt-20 rounded-lg p-8 mb-24 bg-white mx-auto my-auto">
         
    	 <form:form action="${pageContext.servletContext.contextPath}/users/${type}" method="POST" modelAttribute="user">
    	    
    	    <div class="relative mb-2">
              <form:input path="name" placeholder="Enter name" class="py-1 px-3 w-full bg-white rounded border border-gray-300 outline-none "/>
            </div>
            <div class="relative mb-2">
               <form:errors cssClass="text-red-500" path="name" />
            </div>
            
            <div class="relative mb-2">
              <form:input path="email" placeholder="Enter email" class="py-1 px-3 w-full bg-white rounded border border-gray-300 outline-none "/>
            </div>
            <div class="relative mb-2">
               <form:errors cssClass="text-red-500" path="email" />
            </div>
            
            <div class="relative mb-2">
              <form:input path="country" placeholder="Enter country" class="py-1 px-3 w-full bg-white rounded border border-gray-300 outline-none "/>
            </div>
            <div class="relative mb-2">
               <form:errors cssClass="text-red-500" path="country" />
            </div>
            
            <form:input type="hidden" path="id" />
           
           <div class="text-center">
             <form:button type="submit" class="bg-purple-600 px-2 py-2 hover:bg-purple-700 focus:outline-none text-white rounded-sm">Submit</form:button>
           </div>
         </form:form>
    	  
    </div>
   </div>
</body>
</html>
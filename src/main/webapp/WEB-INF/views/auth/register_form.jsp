<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blog System | Register-form</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

</head>
<body>
    
    <%
    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
  
    %>
    
    <c:if test="${current_user!=null}">
      <c:redirect url="/" />
    </c:if>
    
	<div class="flex flex-col container h-screen bg-blue-300">
	   <jsp:include page="../helpers/header.jsp" />
	   
	   <div class="flex flex-col shadow-lg rounded-lg p-8 bg-white mx-auto my-auto">
	     
	     <h1 class="font-medium text-center text-xl mb-4">Register</h1>
	     
	     <h3 class="text-red-400 text-center mb-2"><c:out value="${errors}" /></h3>
	     
	     <form:form action="${pageContext.servletContext.contextPath}/auth/register" method="POST" modelAttribute="user">
    	    
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
              <form:input type="password" path="password" placeholder="Enter password" class="py-1 px-3 w-full bg-white rounded border border-gray-300 outline-none "/>
            </div>
            <div class="relative mb-2">
               <form:errors cssClass="text-red-500" path="password" />
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
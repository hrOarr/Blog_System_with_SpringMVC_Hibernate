<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Articles | ${article.title}</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
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
   
   <div class="container bg-blue-300">
      <!-- include header section -->
      <jsp:include page="../helpers/header.jsp" />
	    <!-- add article button -->
	    <div class="flex md:flex-row flex-col md:justify-center justify-center pt-2">
	      <div class="p-2">
	       <a href="<%=request.getContextPath()%>/articles/add"><button class="bg-blue-600 px-2 py-2 hover:bg-blue-700 focus:outline-none text-white rounded-sm">Add New Article</button></a>
	      </div>
	    </div>
      
      <!-- edit article button -->
      <div class="row pl-10 pt-2 pr-10 pb-20">
        <c:if test="${current_user.getId()==article.user.getId()}">
          <div class="justify-start">
           <div>
             <a href="<%=request.getContextPath()%>/articles/edit/${article.id}"><button class="bg-blue-500 px-2 py-2 hover:bg-blue-700 focus:outline-none text-white rounded-sm">Edit Article</button></a>
           </div>
          </div>
        </c:if>
        
        <div class="py-4 px-8 mt-3 bg-white w-full justify-center shadow-lg rounded-lg">
           <h2 class="text-4xl"><a href="<%=request.getContextPath()%>/articles/${article.id}" class="no-underline">${article.title}</a></h2>
           <div>
             <span class="italic">published by</span> <span class="font-bold">${article.getUser().getName()}</span>
           </div>
           <div class="mb-3 mt-2">
			  <span class="italic font-bold underline">Tags: </span>
		      <c:forEach var="tag" items="${article.getTags()}">
			     <span><button class="bg-green-300 px-1"><c:out value="${tag.getName()}" /></button></span>
			  </c:forEach>
		   </div>
           <p class="pt-2">
             ${article.body}
           </p>
        </div>
      </div>
   </div>
</body>
</html>
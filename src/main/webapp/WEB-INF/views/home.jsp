<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home | Blog System</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

</head>
<body>
    
	<div class="container bg-blue-300">
	   <jsp:include page="helpers/header.jsp" />
		<div class="flex flex-col md:flex-row justify-center pt-2 md:pl-0 pl-10">
			<div class="flex p-2">
				<a href="<%=request.getContextPath()%>/articles/add">
				  <button class="bg-blue-600 px-2 py-2 hover:bg-blue-700 focus:outline-none text-white rounded-sm">Add New Article</button>
				</a>
			</div>
		</div>
		
		<c:out value="${user_test}" />
		
		<div class="flex flex-col md:flex-row pl-10 pt-2 pr-10 pb-20">
		  <!-- show all articles -->
		   <div class="flex flex-col w-full md:w-5/6">
			   <c:choose>
				 <c:when test="${not empty articles}">
					 <c:forEach var="article" items="${articles}">
						 <div class="py-4 px-8 mt-3 w-full bg-white justify-center shadow-lg rounded-lg">
							 <h2 class="text-4xl">
								<a href="<%=request.getContextPath()%>/articles/${article.id}" class="no-underline">${article.title}</a>
							 </h2>
							 <div>
								<span class="italic">published by</span> <span class="font-bold">${article.getUser().getName()}</span>
							 </div>
							 <div class="mb-3 mt-2">
							   <span class="italic font-bold underline">Tags: </span>
							   <c:forEach var="tag" items="${article.getTags()}">
							     <a href="<%=request.getContextPath()%>/articles/byTag?tag=${tag.getName()}"><button class="bg-green-300 px-1"><c:out value="${tag.getName()}" /></button></a>
							   </c:forEach>
							 </div>
							 <p class="pt-2">${article.body}</p>
						 </div>
					 </c:forEach>
				 </c:when>
				 <c:otherwise>
					<h4 class="text-center mt-3">No Article yet.</h4>
				 </c:otherwise>
			    </c:choose>
		  </div>
		  
		  <!-- right sidebar (tag-list) -->
		  <div class="flex flex-col w-full h-full md:w-1/6 md:ml-2 mt-3 bg-white shadow rounded-lg pl-2 pr-2 pt-2 pb-4">
			  <div class="text-xl font-medium text-center">All Tags</div>
			  <div class="pt-2">
				  <c:forEach var="tag" items="${tags}">
				    <a href="<%=request.getContextPath()%>/articles/byTag?tag=${tag.getName()}"><button class="bg-indigo-400 text-white shadow p-1 m-1"><c:out value="${tag.getName()}" /></button></a>
				  </c:forEach>
			  </div>
			  
			  <c:if test="${empty tags}">
			    <div>No tag yet</div>
			  </c:if>
		  </div>
	  </div>
	</div>
</body>
</html>
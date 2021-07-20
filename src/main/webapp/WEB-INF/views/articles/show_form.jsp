<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Article form</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

<script src="https://cdn.tiny.cloud/1/en64pjam2gyx9a0j1nlqd1yqpj35cv2r2nx27kthovcvcefd/tinymce/5/tinymce.min.js"></script>

    <script>
      tinymce.init({
        selector: '#mytextarea'
      });
    </script>

</head>
<body>
  
    <%
    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
  
    %>
   
  <div class="container h-screen bg-blue-300">
     <!-- include header section -->
     <jsp:include page="../helpers/header.jsp" />
     <div class="row justify-center p-20">
       
       <c:if test="${type=='edit' && current_user.getId()!=articleDTO.getUser_id()}">
         <c:redirect url="/" />
       </c:if>
       
       <c:if test="${current_user!=null}">
       
       <div class="col-md-12">
         <h1 class="text-center text-4xl">
           <c:if test="${type=='add'}">
             New Article
           </c:if>
           <c:if test="${type=='edit'}">
             Edit Article
           </c:if>
         </h1>
       </div>
       
       <div class="pt-3">
	       <form:form action="${pageContext.servletContext.contextPath}/articles/${type}" method="POST" modelAttribute="articleDTO">
	         
	         <form:label path="title" class="block text-sm font-medium text-gray-700">Enter title</form:label>
	         <form:input type="text" path="title" placeholder="Enter title" class="w-full mt-2 mb-2 px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:border-green-500" />
	         <form:errors cssClass="relative mb-2 text-red-500" path="title" />
	         
	         <form:label path="tags" class="block text-sm font-medium text-gray-700">Tags</form:label>
	         <form:input type="text" path="tags" placeholder="Enter tags" class="w-full mt-2 mb-2 px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:border-green-500" />
	         <form:errors cssClass="relative mb-2 text-red-500" path="tags" />
	         
	         <div class="mb-1">
	              <form:label path="body" class="block text-sm font-medium text-gray-700">
	                Content
	              </form:label>
	              <div class="mt-1">
	                <form:textarea id="mytextarea" path="body" rows="4" cols="48" class="w-full px-3 py-2 text-gray-700 border rounded-lg focus:outline-none" placeholder="Enter contents"/>
	              </div>
	         </div>
	         <form:errors cssClass="relative mb-2 text-red-500" path="body" />
	         
	         <div>
	           <form:input type="hidden" path="user_id" value="${current_user.getId()}" />
	         </div>
	         <form:input type="hidden" path="id" />
	         <form:errors cssClass="relative mb-2 text-red-500" path="user_id" />
	         
	         <div class="justify-center">
	           <form:button type="submit" class="btn btn-primary mt-2">Submit</form:button>
	         </div>
	       </form:form>
       </div>
       </c:if>
       <!-- if not user logged in -->
       <c:if test="${current_user==null}">
          <div class="font-medium text-lg">To add/edit a article, you need to login first</div>
       </c:if>
     </div>
  </div>
</body>
</html>
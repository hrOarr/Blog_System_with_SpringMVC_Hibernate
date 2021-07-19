<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	  <nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand text-2xl font-medium" href="${pageContext.servletContext.contextPath}/">Blog System</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link text-xl font-medium" href="${pageContext.servletContext.contextPath}/articles">Articles</a>
	      </li>
	    </ul>
	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form>
	    <ul class="navbar-nav ml-auto">
	     <c:if test="${current_user==null}">
	      <li class="nav-item">
	        <a class="nav-link text-xl font-medium" href="${pageContext.servletContext.contextPath}/auth/login">Sign In</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link text-xl font-medium" href="${pageContext.servletContext.contextPath}/auth/register">Sign Up</a>
	      </li>
	      </c:if>
	      <c:if test="${current_user!=null}">
	      <li class="nav-item">
	        <a class="nav-link text-xl font-medium" href="#"><c:out value="${current_user.getName()}" /></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link text-xl font-medium" href="${pageContext.servletContext.contextPath}/auth/logout">Logout</a>
	      </li>
	      </c:if>
	    </ul>
	  </div>
   </nav>
</body>
</html>
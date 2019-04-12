<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>

<head>
<title>Company Home Page</title>
</head>

<body>
	<c:set var="url" value="${pageContext.request.contextPath}"></c:set>
	<h2>luv2code Company Home Page</h2>
	<hr>

	Welcome to the home page!

	<hr>
	<p>
		User:
		<security:authentication property="principal.username" />
		<br> <br> Role(s):
		<security:authentication property="principal.authorities" />
	</p>
	

	<security:authorize access="hasRole('MANAGER')">
	<p>
		<a href="<c:out value = "${url}"/>/leaders">LeaderShip Meeting</a>
		(Only for Manager Purpose)
	</p>
	<hr>
	</security:authorize>
	

	<security:authorize access="hasRole('ADMIN')">
	<p>
		<a href="<c:out value = "${url}"/>/systems">IT Systems Meeting</a>
		(Only for Admin Purpose)
		
	</p>
	<hr>
	</security:authorize>
	
	<%-- <c:url value="${pageContext.request.contextPath}" var ="url"></c:url> --%>
	<form:form action="${url}/logout" method="POST">
		<input type="submit" value="Logout" />
	</form:form>
</body>

</html>
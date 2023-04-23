<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Listado de posts</title>
</head>
<body>
    <h1>Listado de posts</h1>
    <c:forEach var="post" items="${posts}">
        <div class="post">
            <!-- Título -->
            <h2>${post.title}</h2>
            <!-- Extracto -->
            <p>${post.excerpt}</p>
            <!-- Enlace a la página del post -->
            <a href="${pageContext.request.contextPath}/post/${post.id}">Leer más</a>
        </div>
    </c:forEach>
</body>
</html>
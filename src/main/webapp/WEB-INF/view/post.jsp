<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${post.title}</title>
</head>
<body>
    <p>${post.date}</p>
    <img src="${post.imageUrl}" alt="Imagen del post">
    <div class="content">
        ${post.content}
    </div>
</body>
</html>

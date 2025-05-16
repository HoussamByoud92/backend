<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Liste des Fournisseurs</title></head>
<body>
<h1>Fournisseurs</h1>
<a href="${pageContext.request.contextPath}/suppliers/new">Ajouter</a>
<table border="1">
    <tr>
        <th>Nom</th>
        <th>Code</th>
        <th>Contact</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${suppliers}" var="sup">
        <tr>
            <td>${sup.name}</td>
            <td>${sup.code}</td>
            <td>${sup.contactPerson}</td>
            <td>${sup.email}</td>
            <td>
                <a href="${pageContext.request.contextPath}/suppliers/edit?id=${sup.id}">Modifier</a>
                <form method="post" action="${pageContext.request.contextPath}/suppliers/delete" style="display:inline;">
                    <input type="hidden" name="id" value="${sup.id}" />
                    <input type="submit" value="Supprimer" />
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

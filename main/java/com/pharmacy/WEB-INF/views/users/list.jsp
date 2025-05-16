<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Liste des Utilisateurs</title></head>
<body>
<h1>Utilisateurs</h1>

<form method="get" action="${pageContext.request.contextPath}/users">
    <input type="text" name="q" value="${param.q}" placeholder="Recherche par nom ou email" />
    <input type="submit" value="Rechercher" />
</form>

<a href="${pageContext.request.contextPath}/users/new">Ajouter un utilisateur</a>

<table border="1">
    <tr>
        <th>Nom d'utilisateur</th>
        <th>Nom complet</th>
        <th>Email</th>
        <th>Rôle</th>
        <th>Actions</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.username}</td>
            <td>${user.fullName}</td>
            <td>${user.email}</td>
            <td>${user.role}</td>
            <td>
                <a href="${pageContext.request.contextPath}/users/edit?id=${user.id}">Modifier</a>
                <form method="post" action="${pageContext.request.contextPath}/users/delete" style="display:inline;">
                    <input type="hidden" name="id" value="${user.id}" />
                    <input type="submit" value="Supprimer" onclick="return confirm('Confirmer la suppression ?');" />
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

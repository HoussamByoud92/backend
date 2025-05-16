<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>${user != null ? "Modifier" : "Ajouter"} un Utilisateur</title></head>
<body>
<h1>${user != null ? "Modifier" : "Ajouter"} un Utilisateur</h1>
<form method="post" action="${pageContext.request.contextPath}/users">
    <input type="hidden" name="id" value="${user.id}" />
    <label>Nom d'utilisateur:
        <input type="text" name="username" value="${user.username}" required />
    </label><br/>
    <label>Nom complet:
        <input type="text" name="fullName" value="${user.fullName}" required />
    </label><br/>
    <label>Email:
        <input type="email" name="email" value="${user.email}" required />
    </label><br/>
    <label>Rôle:
        <select name="role">
            <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
            <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>Utilisateur</option>
        </select>
    </label><br/>
    <label>Mot de passe:
        <input type="password" name="password" />
        <small>Remplissez uniquement si vous souhaitez changer le mot de passe</small>
    </label><br/>
    <input type="submit" value="Enregistrer" />
</form>
</body>
</html>

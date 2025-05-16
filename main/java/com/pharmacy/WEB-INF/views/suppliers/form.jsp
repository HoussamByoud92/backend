<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Formulaire Fournisseur</title></head>
<body>
<h1>${supplier != null ? "Modifier" : "Ajouter"} un Fournisseur</h1>
<form method="post" action="${pageContext.request.contextPath}/suppliers">
    <input type="hidden" name="id" value="${supplier.id}" />
    <label>Nom: <input type="text" name="name" value="${supplier.name}" /></label><br/>
    <label>Code: <input type="text" name="code" value="${supplier.code}" /></label><br/>
    <label>Contact: <input type="text" name="contactPerson" value="${supplier.contactPerson}" /></label><br/>
    <label>Téléphone: <input type="text" name="phoneNumber" value="${supplier.phoneNumber}" /></label><br/>
    <label>Email: <input type="email" name="email" value="${supplier.email}" /></label><br/>
    <label>Adresse: <input type="text" name="address" value="${supplier.address}" /></label><br/>
    <label>Notes: <textarea name="notes">${supplier.notes}</textarea></label><br/>
    <input type="submit" value="Enregistrer" />
</form>
</body>
</html>

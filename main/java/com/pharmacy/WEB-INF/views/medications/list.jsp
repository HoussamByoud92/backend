<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medications</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 8px; }
        th { background-color: #f4f4f4; }
        .actions a { margin: 0 5px; }
    </style>
</head>
<body>
<h2>Medication List</h2>

<a href="${pageContext.request.contextPath}/medications/new">➕ Add New Medication</a>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Code</th>
        <th>Type</th>
        <th>Dosage</th>
        <th>Stock</th>
        <th>Expiration Date</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="med" items="${medications}">
        <tr>
            <td>${med.name}</td>
            <td>${med.code}</td>
            <td>${med.type}</td>
            <td>${med.dosage}</td>
            <td>${med.stock}</td>
            <td>${med.expirationDate}</td>
            <td class="actions">
                <a href="${pageContext.request.contextPath}/medications/edit?id=${med.id}">✏️ Edit</a>
                <form action="${pageContext.request.contextPath}/medications/delete" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${med.id}" />
                    <button type="submit" onclick="return confirm('Delete this medication?')">🗑️ Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>

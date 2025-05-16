<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medication Form</title>
    <style>
        form { max-width: 600px; margin: auto; }
        label, input, select, textarea { display: block; width: 100%; margin: 8px 0; }
        input[type=submit] { width: auto; }
    </style>
</head>
<body>
<h2>${medication != null ? "Edit Medication" : "Add New Medication"}</h2>

<form method="post" action="${pageContext.request.contextPath}/medications">
    <c:if test="${medication != null}">
        <input type="hidden" name="id" value="${medication.id}" />
    </c:if>

    <label>Name:</label>
    <input type="text" name="name" value="${medication.name}" required />

    <label>Code:</label>
    <input type="text" name="code" value="${medication.code}" required />

    <label>Description:</label>
    <textarea name="description">${medication.description}</textarea>

    <label>Type:</label>
    <input type="text" name="type" value="${medication.type}" required />

    <label>Dosage:</label>
    <input type="text" name="dosage" value="${medication.dosage}" required />

    <label>Price (MAD):</label>
    <input type="number" step="0.01" name="price" value="${medication.price}" required />

    <label>Stock:</label>
    <input type="number" name="stock" value="${medication.stock}" required />

    <label>Alert Threshold:</label>
    <input type="number" name="alertThreshold" value="${medication.alertThreshold}" required />

    <label>Expiration Date:</label>
    <input type="date" name="expirationDate" value="${medication.expirationDate}" min="${today}" required />

    <label>Supplier:</label>
    <select name="supplierId" required>
        <c:forEach var="sup" items="${suppliers}">
            <option value="${sup.id}" ${medication != null && sup.id == medication.supplierId ? 'selected' : ''}>
                    ${sup.name}
            </option>
        </c:forEach>
    </select>

    <input type="submit" value="Save Medication" />
</form>

</body>
</html>

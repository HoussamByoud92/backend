<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Ventes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h2 {
            margin: 20px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 8px 16px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .back-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h2>Liste des Ventes</h2>

<a href="${pageContext.request.contextPath}/dashboard" class="back-btn">⬅ Retour au Dashboard</a>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Date</th>
        <th>Client</th>
        <th>Total</th>
        <th>Détails</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="sale" items="${sales}">
        <tr>
            <td>${sale.id}</td>
            <td>${sale.saleDate}</td>
            <td>${sale.customerName}</td>
            <td>${sale.totalAmount}</td>
            <td>
                <c:forEach var="item" items="${sale.items}">
                    ${item.medication.name} (${item.quantity})<br />
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>

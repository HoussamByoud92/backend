<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Rapport Global</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h2 {
            margin-top: 30px;
        }

        .report-card {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            width: 250px;
            margin: 15px;
            text-align: center;
            background-color: #f9f9f9;
            display: inline-block;
        }

        .report-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .report-card h3 {
            font-size: 28px;
            color: #333;
        }

        .report-card span {
            font-size: 18px;
            color: #666;
        }
    </style>
</head>
<body>
<h2>Rapport Global</h2>

<div class="report-container">
    <div class="report-card">
        <h3>${totalSales}</h3>
        <span>Total des ventes</span>
    </div>
    <div class="report-card">
        <h3>${totalMedications}</h3>
        <span>Médicaments enregistrés</span>
    </div>
    <div class="report-card">
        <h3>${totalSuppliers}</h3>
        <span>Fournisseurs actifs</span>
    </div>
    <div class="report-card">
        <h3>${totalUsers}</h3>
        <span>Utilisateurs</span>
    </div>
</div>

<a href="${pageContext.request.contextPath}/dashboard">⬅ Retour au Dashboard</a>
</body>
</html>

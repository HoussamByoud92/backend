<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - PharmaLive</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
        }
        h2 {
            margin-top: 40px;
        }
        .section {
            margin-bottom: 50px;
        }
        .alerts, .sales-table {
            border-collapse: collapse;
            width: 100%;
        }
        .alerts th, .alerts td, .sales-table th, .sales-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .alerts th, .sales-table th {
            background-color: #f2f2f2;
        }
        .chart-container {
            width: 100%;
            max-width: 700px;
            margin: auto;
        }
    </style>
</head>
<body>

<h1>Welcome to PharmaLive Dashboard</h1>

<div class="section">
    <h2>💊 Medication Distribution</h2>
    <div class="chart-container">
        <canvas id="medicationChart"></canvas>
    </div>
</div>

<div class="section">
    <h2>📉 Sales in the Last 7 Days</h2>
    <div class="chart-container">
        <canvas id="salesHistogram"></canvas>
    </div>
</div>

<div class="section">
    <h2>⚠️ Low Stock Medications</h2>
    <table class="alerts">
        <tr><th>Name</th><th>Quantity</th></tr>
        <c:forEach var="med" items="${lowStockMedications}">
            <tr>
                <td>${med.name}</td>
                <td>${med.quantity}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty lowStockMedications}">
            <tr><td colspan="2">No low stock medications.</td></tr>
        </c:if>
    </table>
</div>

<div class="section">
    <h2>⌛ Expired Medications</h2>
    <table class="alerts">
        <tr><th>Name</th><th>Expiry Date</th></tr>
        <c:forEach var="med" items="${expiredMedications}">
            <tr>
                <td>${med.name}</td>
                <td>${med.expiryDate}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty expiredMedications}">
            <tr><td colspan="2">No expired medications.</td></tr>
        </c:if>
    </table>
</div>

<div class="section">
    <h2>📄 Recent Sales</h2>
    <table class="sales-table">
        <tr><th>Date</th><th>Total Amount</th></tr>
        <c:forEach var="sale" items="${recentSales}">
            <tr>
                <td>${sale.saleDate}</td>
                <td>${sale.totalAmount}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<div class="section">
    <h2>💵 Total Sales Today</h2>
    <p><strong>${todaySales}</strong> MAD</p>
</div>

<script>
    // Pie Chart
    const ctxPie = document.getElementById('medicationChart').getContext('2d');
    const medicationChart = new Chart(ctxPie, {
        type: 'pie',
        data: {
            labels: ${medicationTypesJson},
            datasets: [{
                label: 'Medication Types',
                data: ${medicationCountsJson},
                backgroundColor: ['#ff6384', '#36a2eb', '#ffce56', '#4bc0c0', '#9966ff']
            }]
        }
    });

    // Sales Histogram
    const ctxHist = document.getElementById('salesHistogram').getContext('2d');
    const salesHistogram = new Chart(ctxHist, {
        type: 'bar',
        data: {
            labels: ${histogramLabelsJson},
            datasets: [{
                label: 'Daily Sales (MAD)',
                data: ${histogramDataJson},
                backgroundColor: '#36a2eb'
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    </

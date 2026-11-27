<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Ticket Management System</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f9fafb;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        main {
            flex-grow: 1;
            padding: 20px;
        }
        .container {
            max-width: 1400px;
            margin: 0 auto;
        }
        .header {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            padding: 30px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        h1 {
            color: #333;
            font-size: 2.5em;
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .stat-card:hover {
            transform: translateY(-5px);
        }
        .stat-card h3 {
            color: #6b7280;
            font-size: 14px;
            font-weight: 600;
            text-transform: uppercase;
            margin-bottom: 10px;
        }
        .stat-card .number {
            font-size: 3em;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .stat-card .label {
            color: #9ca3af;
            font-size: 14px;
        }
        .stat-total { border-left: 5px solid #667eea; }
        .stat-total .number { color: #667eea; }

        .stat-pending { border-left: 5px solid #f59e0b; }
        .stat-pending .number { color: #f59e0b; }

        .stat-solved { border-left: 5px solid #10b981; }
        .stat-solved .number { color: #10b981; }

        .charts-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(450px, 1fr));
            gap: 30px;
            margin-bottom: 30px;
        }
        .chart-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .chart-card h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 1.5em;
        }
        .chart-container {
            position: relative;
            height: 300px;
        }
        .recent-tickets {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .recent-tickets h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 1.5em;
        }
        .feedback-item {
            padding: 15px;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }
        .feedback-item:last-child {
            border-bottom: none;
        }
        .feedback-info {
            flex-grow: 1;
            min-width: 200px;
        }
        .feedback-info h4 {
            color: #333;
            margin-bottom: 5px;
        }
        .feedback-info p {
            color: #6b7280;
            font-size: 14px;
        }
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }
        .status-pending {
            background: #fef3c7;
            color: #92400e;
        }

        .status-solved {
            background: #d1fae5;
            color: #065f46;
        }

        .category-stats {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        .category-stats h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 1.5em;
        }
        .category-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #e5e7eb;
            flex-wrap: wrap;
            gap: 10px;
        }
        .category-item:last-child {
            border-bottom: none;
        }
        .category-name {
            font-weight: 600;
            color: #333;
            flex-grow: 1;
            min-width: 200px;
        }
        .category-count {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- Main Content -->
    <main>
        <div class="container">
            <div class="header">
                <h1>Dashboard</h1>
                <div>
                    <a href="${pageContext.request.contextPath}/feedbacks" class="btn btn-primary">View All Feedbacks</a>
                </div>
            </div>

            <!-- Statistics Cards -->
            <div class="stats-grid">
                <div class="stat-card stat-total">
                    <h3>Total Feedbacks</h3>
                    <div class="number">${totalFeedbacks}</div>
                    <div class="label">All time Feedbacks</div>
                </div>
                <div class="stat-card stat-pending">
                    <h3>Pending</h3>
                    <div class="number">${pendingCount}</div>
                    <div class="label">Awaiting attention</div>
                </div>

                <div class="stat-card stat-solved">
                    <h3>Solved</h3>
                    <div class="number">${solvedCount}</div>
                    <div class="label">Successfully resolved</div>
                </div>
            </div>

            <!-- Charts -->
            <div class="charts-grid">
                <div class="chart-card">
                    <h2>Feedbacks by Status</h2>
                    <div class="chart-container">
                        <canvas id="statusChart"></canvas>
                    </div>
                </div>
                <div class="chart-card">
                    <h2>Feedbacks by Category</h2>
                    <div class="chart-container">
                        <canvas id="categoryChart"></canvas>
                    </div>
                </div>
            </div>

            <!-- Category Statistics -->
            <div class="category-stats">
                <h2>Category Breakdown</h2>

                <div class="category-item">
                    <span class="category-name">Food Quality Issue</span>
                    <span class="category-count">${foodQualityCount}</span>
                </div>

                <div class="category-item">
                    <span class="category-name">Delivery Issue</span>
                    <span class="category-count">${deliveryIssueCount}</span>
                </div>

                <div class="category-item">
                    <span class="category-name">Wrong or Missing Items</span>
                    <span class="category-count">${orderAccuracyCount}</span>
                </div>

                <div class="category-item">
                    <span class="category-name">Payment / Billing Issue</span>
                    <span class="category-count">${paymentCount}</span>
                </div>

                <div class="category-item">
                    <span class="category-name">App / Website Feedback</span>
                    <span class="category-count">${appFeedbackCount}</span>
                </div>

                <div class="category-item">
                    <span class="category-name">General Inquiry</span>
                    <span class="category-count">${generalInquiryCount}</span>
                </div>
            </div>

            <!-- Recent Feedbacks -->
            <div class="recent-tickets">
                <h2>Recent Feedbacks</h2>
                <c:choose>
                    <c:when test="${not empty recentTickets}">
                        <c:forEach items="${recentTickets}" var="feedback">
                            <div class="feedback-item">
                                <div class="feedback-info">
                                    <h4>${feedback.subject}</h4>
                                    <p>${feedback.customerName} • <fmt:formatDate value="${feedback.listingDateAsDate}" pattern="MMM dd, yyyy HH:mm" /></p>
                                </div>
                                <c:choose>
                                    <c:when test="${feedback.status == 'PENDING'}">
                                        <span class="status-badge status-pending">Pending</span>
                                    </c:when>

                                    <c:when test="${feedback.status == 'SOLVED'}">
                                        <span class="status-badge status-solved">Solved</span>
                                    </c:when>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p style="text-align: center; color: #6b7280; padding: 20px;">No Feedbacks yet</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

    <script>
        // Status Chart (Doughnut) — Only Pending & Solved
        const statusCtx = document.getElementById('statusChart').getContext('2d');
        new Chart(statusCtx, {
            type: 'doughnut',
            data: {
                labels: ['Pending', 'Solved'],
                datasets: [{
                    data: [${pendingCount}, ${solvedCount}],
                    backgroundColor: ['#f59e0b', '#10b981'],
                    borderWidth: 2,
                    borderColor: '#fff'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom', labels: { padding: 15, font: { size: 12 } } }
                }
            }
        });

        // Category Chart (Bar)
        const categoryCtx = document.getElementById('categoryChart').getContext('2d');
        new Chart(categoryCtx, {
            type: 'bar',
            data: {
                labels: ['Food Quality', 'Delivery Issue', 'Wrong/Missing Items', 'App Feedback', 'General Inquiry'],
                datasets: [{
                    label: 'Number of Tickets',
                    data: [${foodQualityCount}, ${deliveryIssueCount}, ${orderAccuracyCount}, ${appFeedbackCount}, ${generalInquiryCount}],
                    backgroundColor: [
                        'rgba(102, 126, 234, 0.8)',
                        'rgba(245, 158, 11, 0.8)',
                        'rgba(220, 38, 38, 0.8)',
                        'rgba(16, 185, 129, 0.8)',
                        'rgba(59, 130, 246, 0.8)'
                    ],
                    borderColor: [
                        'rgba(102, 126, 234, 1)',
                        'rgba(245, 158, 11, 1)',
                        'rgba(220, 38, 38, 1)',
                        'rgba(16, 185, 129, 1)',
                        'rgba(59, 130, 246, 1)'
                    ],
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    y: { beginAtZero: true, ticks: { stepSize: 1 } }
                }
            }
        });
    </script>
</body>
</html>
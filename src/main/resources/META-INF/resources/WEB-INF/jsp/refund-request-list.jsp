<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Refund Requests</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            font-weight: bold;
            display: inline-block;
            font-size: 0.875rem;
        }
        .status-pending {
            background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%);
            color: white;
        }
        .status-approved {
            background: linear-gradient(135deg, #34d399 0%, #10b981 100%);
            color: white;
        }
        .status-rejected {
            background: linear-gradient(135deg, #f87171 0%, #ef4444 100%);
            color: white;
        }
        .status-completed {
            background: linear-gradient(135deg, #60a5fa 0%, #3b82f6 100%);
            color: white;
        }
        .table-row {
            transition: all 0.3s ease;
        }
        .table-row:hover {
            transform: scale(1.02);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        @media (max-width: 768px) {
            .responsive-table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
<!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <div class="max-w-7xl mx-auto py-8">
        <!-- Header -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6">
            <h1 class="text-4xl font-bold text-gray-800 mb-6 text-center bg-gradient-to-r from-orange-500 to-red-500 bg-clip-text text-transparent">
                My Refund Requests
            </h1>

            <c:if test="${not empty message}">
                <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-4 rounded-lg shadow-md">
                    <p class="font-bold">${message}</p>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-4 rounded-lg shadow-md">
                    <p class="font-bold">${error}</p>
                </div>
            </c:if>
        </div>

        <!-- Empty State -->
        <c:if test="${empty refundRequests}">
            <div class="glass-effect rounded-2xl shadow-2xl p-12 text-center">
                <div class="mb-6">
                    <svg class="w-24 h-24 mx-auto text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                    </svg>
                </div>
                <h2 class="text-2xl font-bold text-gray-700 mb-3">No Refund Requests</h2>
                <p class="text-gray-600 text-lg">You have no refund requests.</p>
            </div>
        </c:if>

        <!-- Refund Requests Table -->
        <c:if test="${not empty refundRequests}">
            <div class="glass-effect rounded-2xl shadow-2xl p-8">
                <div class="mb-6 flex items-center justify-between">
                    <h2 class="text-2xl font-bold text-gray-800 flex items-center">
                        <span class="bg-orange-500 text-white rounded-full w-10 h-10 flex items-center justify-center mr-3">📋</span>
                        Your Refund Requests
                    </h2>
                    <span class="bg-gradient-to-r from-orange-500 to-red-500 text-white px-4 py-2 rounded-full font-bold">
                        ${refundRequests.size()} Request(s)
                    </span>
                </div>

                <div class="responsive-table overflow-x-auto">
                    <table class="w-full">
                        <thead>
                            <tr class="bg-gradient-to-r from-orange-500 to-red-500 text-white">
                                <th class="px-6 py-4 text-left font-bold rounded-tl-lg">Request Number</th>
                                <th class="px-6 py-4 text-left font-bold">Order Number</th>
                                <th class="px-6 py-4 text-left font-bold">Amount</th>
                                <th class="px-6 py-4 text-left font-bold">Status</th>
                                <th class="px-6 py-4 text-left font-bold">Reason</th>
                                <th class="px-6 py-4 text-left font-bold">Created At</th>
                                <th class="px-6 py-4 text-center font-bold rounded-tr-lg">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="refund" items="${refundRequests}" varStatus="status">
                                <tr class="table-row border-b border-gray-200 ${status.index % 2 == 0 ? 'bg-white' : 'bg-gray-50'}">
                                    <td class="px-6 py-4">
                                        <span class="font-bold text-gray-800">${refund.requestNumber}</span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <span class="font-semibold text-blue-600">${refund.payment.order.orderNumber}</span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <span class="text-lg font-bold text-green-600">$<fmt:formatNumber value="${refund.refundAmount}" pattern="#,##0.00"/></span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <c:choose>
                                            <c:when test="${refund.status == 'PENDING'}">
                                                <span class="status-badge status-pending">PENDING</span>
                                            </c:when>
                                            <c:when test="${refund.status == 'APPROVED'}">
                                                <span class="status-badge status-approved">APPROVED</span>
                                            </c:when>
                                            <c:when test="${refund.status == 'REJECTED'}">
                                                <span class="status-badge status-rejected">REJECTED</span>
                                            </c:when>
                                            <c:when test="${refund.status == 'COMPLETED'}">
                                                <span class="status-badge status-completed">COMPLETED</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="max-w-xs">
                                            <c:choose>
                                                <c:when test="${refund.refundReason.length() > 50}">
                                                    <span class="text-gray-700">${refund.refundReason.substring(0, 50)}...</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-gray-700">${refund.refundReason}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4">
                                        <span class="text-gray-700 font-medium">${refund.createdAt}</span>
                                    </td>
                                    <td class="px-6 py-4 text-center">
                                        <a href="${pageContext.request.contextPath}/refunds/${refund.id}"
                                           class="inline-flex items-center px-4 py-2 bg-gradient-to-r from-blue-500 to-blue-600 text-white font-semibold rounded-lg hover:from-blue-600 hover:to-blue-700 transition duration-300 shadow-md transform hover:scale-105">
                                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                                            </svg>
                                            View
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Summary Footer -->
                <div class="mt-6 p-4 bg-gradient-to-r from-gray-100 to-gray-200 rounded-lg">
                    <div class="flex justify-between items-center flex-wrap gap-4">
                        <div class="text-gray-700">
                            <span class="font-semibold">Total Requests:</span>
                            <span class="font-bold text-orange-600">${refundRequests.size()}</span>
                        </div>
                        <div class="text-sm text-gray-600">
                            Click "View" to see complete refund request details
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</body>
<%@ include file="footer.jsp" %>
</html>
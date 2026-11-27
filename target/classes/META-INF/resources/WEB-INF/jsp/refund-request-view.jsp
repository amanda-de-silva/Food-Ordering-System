<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Refund Request Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
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
        .info-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
    </style>
</head>
<body>
<!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <div class="max-w-6xl mx-auto py-6">
        <!-- Header -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6">
            <h1 class="text-4xl font-bold text-gray-800 mb-6 text-center bg-gradient-to-r from-orange-500 to-red-500 bg-clip-text text-transparent">
                Refund Request Details
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

            <div class="flex justify-center">
                <c:if test="${isAdmin}">
                    <a href="${pageContext.request.contextPath}/refunds/admin/all"
                       class="inline-flex items-center px-6 py-3 bg-gradient-to-r from-blue-600 to-blue-700 text-white font-semibold rounded-lg hover:from-blue-700 hover:to-blue-800 transition duration-300 shadow-lg transform hover:scale-105">
                        ← Back to All Refunds
                    </a>
                </c:if>
                <c:if test="${not isAdmin}">
                    <a href="${pageContext.request.contextPath}/refunds/my"
                       class="inline-flex items-center px-6 py-3 bg-gradient-to-r from-purple-600 to-purple-700 text-white font-semibold rounded-lg hover:from-purple-700 hover:to-purple-800 transition duration-300 shadow-lg transform hover:scale-105">
                        ← My Refund Requests
                    </a>
                </c:if>
            </div>
        </div>

        <!-- Request Information -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6 info-card">
            <h2 class="text-3xl font-bold text-gray-800 mb-6 border-b-4 border-orange-500 pb-3 flex items-center">
                <span class="bg-orange-500 text-white rounded-full w-10 h-10 flex items-center justify-center mr-3 text-xl">📋</span>
                Request Information
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="bg-gradient-to-br from-blue-50 to-blue-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Request Number</p>
                    <p class="text-xl text-gray-800 font-bold">${refundRequest.requestNumber}</p>
                </div>
                <div class="bg-gradient-to-br from-purple-50 to-purple-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Status</p>
                    <c:choose>
                        <c:when test="${refundRequest.status == 'PENDING'}">
                            <span class="status-badge status-pending">PENDING</span>
                        </c:when>
                        <c:when test="${refundRequest.status == 'APPROVED'}">
                            <span class="status-badge status-approved">APPROVED</span>
                        </c:when>
                        <c:when test="${refundRequest.status == 'REJECTED'}">
                            <span class="status-badge status-rejected">REJECTED</span>
                        </c:when>
                        <c:when test="${refundRequest.status == 'COMPLETED'}">
                            <span class="status-badge status-completed">COMPLETED</span>
                        </c:when>
                    </c:choose>
                </div>
                <div class="bg-gradient-to-br from-green-50 to-green-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Refund Amount</p>
                    <p class="text-2xl text-green-600 font-bold">$<fmt:formatNumber value="${refundRequest.refundAmount}" pattern="#,##0.00"/></p>
                </div>
                <div class="bg-gradient-to-br from-yellow-50 to-yellow-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Created At</p>
                    <p class="text-lg text-gray-800 font-bold">${refundRequest.createdAt}</p>
                </div>
                <div class="bg-gradient-to-br from-pink-50 to-pink-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Updated At</p>
                    <p class="text-lg text-gray-800 font-bold">${refundRequest.updatedAt}</p>
                </div>
                <c:if test="${not empty refundRequest.processedAt}">
                    <div class="bg-gradient-to-br from-indigo-50 to-indigo-100 p-5 rounded-xl shadow-md">
                        <p class="text-sm text-gray-600 font-semibold mb-2">Processed At</p>
                        <p class="text-lg text-gray-800 font-bold">${refundRequest.processedAt}</p>
                    </div>
                    <div class="bg-gradient-to-br from-teal-50 to-teal-100 p-5 rounded-xl shadow-md">
                        <p class="text-sm text-gray-600 font-semibold mb-2">Processed By</p>
                        <p class="text-lg text-gray-800 font-bold">${refundRequest.processedBy}</p>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Payment Information -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6 info-card">
            <h2 class="text-3xl font-bold text-gray-800 mb-6 border-b-4 border-orange-500 pb-3 flex items-center">
                <span class="bg-orange-500 text-white rounded-full w-10 h-10 flex items-center justify-center mr-3 text-xl">💳</span>
                Payment Information
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="bg-gradient-to-br from-blue-50 to-blue-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Transaction ID</p>
                    <p class="text-lg text-gray-800 font-bold">${refundRequest.payment.transactionId}</p>
                </div>
                <div class="bg-gradient-to-br from-purple-50 to-purple-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Order Number</p>
                    <p class="text-lg text-gray-800 font-bold">${refundRequest.payment.order.orderNumber}</p>
                </div>
                <div class="bg-gradient-to-br from-red-50 to-red-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Payment Status</p>
                    <p class="text-lg text-red-600 font-bold">${refundRequest.payment.paymentStatus}</p>
                </div>
                <div class="bg-gradient-to-br from-green-50 to-green-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Payment Amount</p>
                    <p class="text-2xl text-green-600 font-bold">$<fmt:formatNumber value="${refundRequest.payment.amount}" pattern="#,##0.00"/></p>
                </div>
            </div>
        </div>

        <!-- Personal Information -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6 info-card">
            <h2 class="text-3xl font-bold text-gray-800 mb-6 border-b-4 border-orange-500 pb-3 flex items-center">
                <span class="bg-orange-500 text-white rounded-full w-10 h-10 flex items-center justify-center mr-3 text-xl">👤</span>
                Personal Information
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="bg-gradient-to-br from-blue-50 to-blue-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Full Name</p>
                    <p class="text-lg text-gray-800 font-bold">${refundRequest.customerName}</p>
                </div>
                <div class="bg-gradient-to-br from-purple-50 to-purple-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Email</p>
                    <p class="text-lg text-gray-800 font-bold break-all">${refundRequest.contactEmail}</p>
                </div>
                <div class="bg-gradient-to-br from-green-50 to-green-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Phone</p>
                    <p class="text-lg text-gray-800 font-bold">${refundRequest.contactPhone}</p>
                </div>
            </div>
        </div>

        <!-- Bank Account Details -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6 info-card">
            <h2 class="text-3xl font-bold text-gray-800 mb-6 border-b-4 border-orange-500 pb-3 flex items-center">
                <span class="bg-orange-500 text-white rounded-full w-10 h-10 flex items-center justify-center mr-3 text-xl">🏦</span>
                Bank Account Details
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="bg-gradient-to-br from-blue-50 to-blue-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Bank Name</p>
                    <p class="text-lg text-gray-800 font-bold">${refundRequest.bankName}</p>
                </div>
                <div class="bg-gradient-to-br from-purple-50 to-purple-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Account Holder Name</p>
                    <p class="text-lg text-gray-800 font-bold">${refundRequest.accountHolderName}</p>
                </div>
                <div class="bg-gradient-to-br from-green-50 to-green-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Account Number</p>
                    <p class="text-lg text-gray-800 font-bold tracking-wider">${refundRequest.accountNumber}</p>
                </div>
                <div class="bg-gradient-to-br from-yellow-50 to-yellow-100 p-5 rounded-xl shadow-md">
                    <p class="text-sm text-gray-600 font-semibold mb-2">Bank Branch</p>
                    <p class="text-lg text-gray-800 font-bold">${refundRequest.bankBranch}</p>
                </div>
            </div>
        </div>

        <!-- Refund Reason -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6 info-card">
            <h2 class="text-3xl font-bold text-gray-800 mb-6 border-b-4 border-orange-500 pb-3 flex items-center">
                <span class="bg-orange-500 text-white rounded-full w-10 h-10 flex items-center justify-center mr-3 text-xl">📝</span>
                Refund Reason
            </h2>
            <div class="bg-gradient-to-br from-gray-50 to-gray-100 p-6 rounded-xl shadow-md border-2 border-gray-200">
                <p class="text-gray-800 leading-relaxed">${refundRequest.refundReason}</p>
            </div>
        </div>

        <!-- Admin Notes -->
        <c:if test="${not empty refundRequest.adminNotes}">
            <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6 info-card">
                <h2 class="text-3xl font-bold text-gray-800 mb-6 border-b-4 border-orange-500 pb-3 flex items-center">
                    <span class="bg-orange-500 text-white rounded-full w-10 h-10 flex items-center justify-center mr-3 text-xl">📌</span>
                    Admin Notes
                </h2>
                <div class="bg-gradient-to-br from-yellow-50 to-yellow-100 p-6 rounded-xl shadow-md border-2 border-yellow-200">
                    <p class="text-gray-800 leading-relaxed">${refundRequest.adminNotes}</p>
                </div>
            </div>
        </c:if>

        <!-- Admin Actions -->
        <c:if test="${isAdmin}">
            <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6">
                <h2 class="text-3xl font-bold text-gray-800 mb-6 border-b-4 border-orange-500 pb-3 flex items-center">
                    <span class="bg-orange-500 text-white rounded-full w-10 h-10 flex items-center justify-center mr-3 text-xl">⚙️</span>
                    Admin Actions
                </h2>

                <c:if test="${refundRequest.status == 'PENDING'}">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- Approve Form -->
                        <form action="${pageContext.request.contextPath}/refunds/admin/${refundRequest.id}/approve" method="post" class="bg-gradient-to-br from-green-50 to-green-100 p-6 rounded-xl shadow-md border-2 border-green-200">
                            <label for="adminNotesApprove" class="block text-sm font-bold text-gray-700 mb-3">
                                Admin Notes (Optional)
                            </label>
                            <textarea id="adminNotesApprove" name="adminNotes" rows="3"
                                      class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-green-500 resize-none mb-4"></textarea>
                            <button type="submit"
                                    class="w-full px-6 py-3 bg-gradient-to-r from-green-500 to-green-600 text-white font-bold rounded-lg hover:from-green-600 hover:to-green-700 transition duration-300 shadow-lg transform hover:scale-105">
                                ✓ Approve Refund
                            </button>
                        </form>

                        <!-- Reject Form -->
                        <form action="${pageContext.request.contextPath}/refunds/admin/${refundRequest.id}/reject" method="post" class="bg-gradient-to-br from-red-50 to-red-100 p-6 rounded-xl shadow-md border-2 border-red-200">
                            <label for="adminNotesReject" class="block text-sm font-bold text-gray-700 mb-3">
                                Rejection Reason <span class="text-red-500">*</span>
                            </label>
                            <textarea id="adminNotesReject" name="adminNotes" rows="3" required
                                      class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-red-500 resize-none mb-4"></textarea>
                            <button type="submit"
                                    class="w-full px-6 py-3 bg-gradient-to-r from-red-500 to-red-600 text-white font-bold rounded-lg hover:from-red-600 hover:to-red-700 transition duration-300 shadow-lg transform hover:scale-105">
                                ✗ Reject Refund
                            </button>
                        </form>
                    </div>
                </c:if>

                <c:if test="${refundRequest.status == 'APPROVED'}">
                    <form action="${pageContext.request.contextPath}/refunds/admin/${refundRequest.id}/complete" method="post" class="bg-gradient-to-br from-blue-50 to-blue-100 p-6 rounded-xl shadow-md border-2 border-blue-200">
                        <label for="adminNotesComplete" class="block text-sm font-bold text-gray-700 mb-3">
                            Admin Notes (Optional)
                        </label>
                        <textarea id="adminNotesComplete" name="adminNotes" rows="3"
                                  class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 resize-none mb-4"></textarea>
                        <button type="submit"
                                class="w-full px-6 py-3 bg-gradient-to-r from-blue-500 to-blue-600 text-white font-bold rounded-lg hover:from-blue-600 hover:to-blue-700 transition duration-300 shadow-lg transform hover:scale-105">
                            ✓ Mark as Completed
                        </button>
                    </form>
                </c:if>
            </div>
        </c:if>
    </div>
</body>
<%@ include file="footer.jsp" %>
</html>
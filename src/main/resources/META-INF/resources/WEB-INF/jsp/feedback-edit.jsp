<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Ticket</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            position: relative;
        }
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.6);
            z-index: 0;
        }
        .container {
            position: relative;
            z-index: 1;
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }
        .input-focus:focus {
            transform: translateY(-2px);
            transition: all 0.3s ease;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.5);
        }
        .form-section {
            animation: slideUp 0.5s ease-out;
        }
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .status-badge {
            display: inline-block;
            animation: pulse 2s ease-in-out infinite;
        }
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
    </style>
</head>
<body class="min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <div class="container max-w-4xl mx-auto px-4 py-8 sm:py-12">
        <div class="glass-effect rounded-2xl shadow-2xl overflow-hidden form-section">
            <!-- Header Section -->
            <div class="bg-gradient-to-r from-indigo-600 via-purple-600 to-pink-600 px-6 sm:px-10 py-8 sm:py-12">
                <div class="text-center">
                    <div class="inline-flex items-center justify-center w-16 h-16 sm:w-20 sm:h-20 bg-white/20 rounded-full mb-4 backdrop-blur-sm">
                        <span class="text-4xl sm:text-5xl">✏️</span>
                    </div>
                    <h1 class="text-3xl sm:text-4xl font-bold text-white mb-2 tracking-tight">Edit Ticket #${feedback.id}</h1>
                    <p class="text-purple-100 text-sm sm:text-base">Update feedback details and manage ticket status</p>
                </div>
            </div>

            <!-- Form Section -->
            <div class="px-6 sm:px-10 py-8 sm:py-10">
                <!-- Status Info Banner -->
                <div class="status-info mb-8 p-5 bg-gradient-to-r from-blue-50 to-indigo-50 border-l-4 border-blue-500 rounded-xl shadow-sm">
                    <div class="flex items-start">
                        <div class="flex-shrink-0">
                            <svg class="h-6 w-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                        <div class="ml-3">
                            <h3 class="text-base font-semibold text-blue-900 mb-1">Current Status</h3>
                            <p class="text-sm text-blue-700">You can update feedback details and change the status below. Use "Mark as Solved" button on the list page for quick status updates.</p>
                        </div>
                    </div>
                </div>

                <form action="${pageContext.request.contextPath}/feedbacks/${feedback.id}" method="post" enctype="multipart/form-data" class="space-y-6">

                    <!-- Customer Name -->
                    <div class="form-group">
                        <label for="customerName" class="block text-sm font-semibold text-gray-700 mb-2">
                            Customer Name <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                </svg>
                            </div>
                            <input type="text" id="customerName" name="customerName" value="${feedback.customerName}" required
                                   class="input-focus w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition-all text-gray-700">
                        </div>
                    </div>

                    <!-- Contact Number -->
                    <div class="form-group">
                        <label for="contactNumber" class="block text-sm font-semibold text-gray-700 mb-2">
                            Contact Number <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                                </svg>
                            </div>
                            <input type="tel" id="contactNumber" name="contactNumber" value="${feedback.contactNumber}" required
                                   class="input-focus w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition-all text-gray-700">
                        </div>
                    </div>

                    <!-- Email Address -->
                    <div class="form-group">
                        <label for="email" class="block text-sm font-semibold text-gray-700 mb-2">
                            Email Address <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                                </svg>
                            </div>
                            <input type="email" id="email" name="email" value="${feedback.email}" required
                                   class="input-focus w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition-all text-gray-700">
                        </div>
                    </div>

                    <!-- Category -->
                    <div class="form-group">
                        <label for="category" class="block text-sm font-semibold text-gray-700 mb-2">
                            Category <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"></path>
                                </svg>
                            </div>
                            <select id="category" name="category" required
                                    class="input-focus w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition-all text-gray-700 appearance-none bg-white cursor-pointer">
                                <option value="FOOD_QUALITY" ${feedback.category == 'FOOD_QUALITY' ? 'selected' : ''}>
                                    Food Quality Issue
                                </option>
                                <option value="DELIVERY_ISSUE" ${feedback.category == 'DELIVERY_ISSUE' ? 'selected' : ''}>
                                    Delivery Issue
                                </option>
                                <option value="ORDER_ACCURACY" ${feedback.category == 'ORDER_ACCURACY' ? 'selected' : ''}>
                                    Wrong or Missing Items
                                </option>
                                <option value="PAYMENT_ISSUE" ${feedback.category == 'PAYMENT_ISSUE' ? 'selected' : ''}>
                                    Payment / Billing Issue
                                </option>
                                <option value="APP_FEEDBACK" ${feedback.category == 'APP_FEEDBACK' ? 'selected' : ''}>
                                    App / Website Feedback
                                </option>
                                <option value="GENERAL_INQUIRY" ${feedback.category == 'GENERAL_INQUIRY' ? 'selected' : ''}>
                                    General Inquiry
                                </option>
                            </select>
                            <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                                <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Status -->
                    <div class="form-group">
                        <label for="status" class="block text-sm font-semibold text-gray-700 mb-2">
                            Status <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                            </div>
                            <select id="status" name="status" required
                                    class="input-focus w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition-all text-gray-700 appearance-none bg-white cursor-pointer">
                                <option value="PENDING" ${feedback.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                                <option value="IN_PROGRESS" ${feedback.status == 'IN_PROGRESS' ? 'selected' : ''}>In Progress</option>
                                <option value="SOLVED" ${feedback.status == 'SOLVED' ? 'selected' : ''}>Solved</option>
                                <option value="CLOSED" ${feedback.status == 'CLOSED' ? 'selected' : ''}>Closed</option>
                            </select>
                            <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                                <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Subject -->
                    <div class="form-group">
                        <label for="subject" class="block text-sm font-semibold text-gray-700 mb-2">
                            Subject <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"></path>
                                </svg>
                            </div>
                            <input type="text" id="subject" name="subject" value="${feedback.subject}" required
                                   class="input-focus w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition-all text-gray-700">
                        </div>
                    </div>

                    <!-- Concern/Details -->
                    <div class="form-group">
                        <label for="concern" class="block text-sm font-semibold text-gray-700 mb-2">
                            Concern/Details <span class="text-red-500">*</span>
                        </label>
                        <textarea id="concern" name="concern" required rows="5"
                                  class="input-focus w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition-all text-gray-700 resize-vertical">${feedback.concern}</textarea>
                    </div>

                    <!-- File Upload -->
                    <div class="form-group">
                        <label for="file" class="block text-sm font-semibold text-gray-700 mb-2">
                            Update Document (Optional)
                        </label>
                        <c:if test="${not empty feedback.documentPath}">
                            <div class="current-file mb-3 p-4 bg-gradient-to-r from-green-50 to-emerald-50 border-l-4 border-green-500 rounded-xl">
                                <div class="flex items-center">
                                    <svg class="h-5 w-5 text-green-600 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"></path>
                                    </svg>
                                    <span class="text-sm font-medium text-green-900">Current file: ${feedback.documentPath}</span>
                                </div>
                            </div>
                        </c:if>
                        <div class="relative">
                            <input type="file" id="file" name="file" accept="image/*,.pdf,.doc,.docx"
                                   class="w-full px-4 py-3 border-2 border-dashed border-gray-300 rounded-xl focus:border-purple-500 focus:ring-4 focus:ring-purple-100 outline-none transition-all text-gray-700 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-purple-50 file:text-purple-700 hover:file:bg-purple-100 cursor-pointer">
                        </div>
                        <p class="info-text mt-2 text-xs text-gray-500 flex items-center">
                            <svg class="h-4 w-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            Upload a new file to replace the existing one
                        </p>
                    </div>

                    <!-- Button Group -->
                    <div class="flex flex-col sm:flex-row gap-4 pt-6">
                        <button type="submit" class="btn-primary flex-1 py-4 px-6 rounded-xl text-white font-semibold text-base shadow-lg hover:shadow-xl transform transition-all duration-300 flex items-center justify-center">
                            <svg class="h-5 w-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"></path>
                            </svg>
                            Update Ticket
                        </button>
                        <a href="${pageContext.request.contextPath}/feedbacks" class="flex-1 py-4 px-6 bg-gray-600 hover:bg-gray-700 rounded-xl text-white font-semibold text-base text-center shadow-lg hover:shadow-xl transform hover:-translate-y-1 transition-all duration-300 flex items-center justify-center">
                            <svg class="h-5 w-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                            </svg>
                            Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<%@ include file="footer.jsp" %>
</html>
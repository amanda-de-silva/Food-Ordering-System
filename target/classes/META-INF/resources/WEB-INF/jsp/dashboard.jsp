<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes pulse-soft {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
        }
        .float-animation {
            animation: float 3s ease-in-out infinite;
        }
        .slide-in {
            animation: slideIn 0.6s ease-out forwards;
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        .gradient-border {
            position: relative;
            background: white;
            border-radius: 1rem;
        }
        .gradient-border::before {
            content: '';
            position: absolute;
            inset: 0;
            border-radius: 1rem;
            padding: 2px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
        }
        .stat-card {
            position: relative;
            overflow: hidden;
        }
        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 100px;
            height: 100px;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            border-radius: 50%;
            transform: translate(30%, -30%);
        }
        .action-card {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .action-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
        .icon-wrapper {
            transition: transform 0.3s ease;
        }
        .action-card:hover .icon-wrapper {
            transform: scale(1.1) rotate(5deg);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-blue-50 to-purple-50 min-h-screen">
<%@ include file="/WEB-INF/jsp/header.jsp" %>

<!-- Navigation Header -->
<nav class="glass-effect sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
        <div class="flex items-center space-x-3">
            <div class="bg-gradient-to-br from-blue-500 to-purple-600 p-2 rounded-xl ">
                <i class="fas fa-utensils text-white text-2xl"></i>
            </div>
            <h1 class="text-2xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">Food Ordering System</h1>
        </div>

    </div>
</nav>

<!-- Main Content -->
<div class="max-w-7xl mx-auto px-6 py-8">

    <!-- Welcome Section -->
    <div class="relative bg-gradient-to-r from-blue-600 via-purple-600 to-blue-800 text-white rounded-2xl p-10 mb-8 shadow-2xl overflow-hidden slide-in">
        <div class="absolute top-0 right-0 w-64 h-64 bg-white opacity-5 rounded-full -mr-32 -mt-32"></div>
        <div class="absolute bottom-0 left-0 w-48 h-48 bg-white opacity-5 rounded-full -ml-24 -mb-24"></div>
        <div class="relative z-10">
            <h2 class="text-5xl font-bold mb-3 tracking-tight">Welcome Back!</h2>
            <p class="text-blue-100 text-lg">Manage your orders, payments, and account from one place</p>
        </div>
        <div class="absolute right-8 top-1/2 transform -translate-y-1/2 opacity-20">
            <i class="fas fa-utensils text-9xl float-animation"></i>
        </div>
    </div>

    <!-- Quick Stats -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <div class="stat-card bg-white rounded-2xl shadow-lg p-6 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1 slide-in" style="animation-delay: 0.1s">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-gray-500 text-sm font-semibold uppercase tracking-wide">My Orders</p>
                    <p class="text-4xl font-bold bg-gradient-to-r from-blue-600 to-blue-400 bg-clip-text text-transparent mt-2">-</p>
                </div>
                <div class="bg-gradient-to-br from-blue-400 to-blue-600 p-4 rounded-2xl shadow-lg">
                    <i class="fas fa-shopping-bag text-white text-3xl"></i>
                </div>
            </div>
            <a href="/orders" class="text-blue-600 text-sm font-bold mt-4 inline-flex items-center hover:gap-2 transition-all group">
                View Orders
                <i class="fas fa-arrow-right ml-1 group-hover:translate-x-1 transition-transform"></i>
            </a>
        </div>

        <div class="stat-card bg-white rounded-2xl shadow-lg p-6 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1 slide-in" style="animation-delay: 0.2s">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-gray-500 text-sm font-semibold uppercase tracking-wide">Cart Items</p>
                    <p class="text-4xl font-bold bg-gradient-to-r from-green-600 to-green-400 bg-clip-text text-transparent mt-2">-</p>
                </div>
                <div class="bg-gradient-to-br from-green-400 to-green-600 p-4 rounded-2xl shadow-lg">
                    <i class="fas fa-cart-shopping text-white text-3xl"></i>
                </div>
            </div>
            <a href="/cart" class="text-green-600 text-sm font-bold mt-4 inline-flex items-center hover:gap-2 transition-all group">
                View Cart
                <i class="fas fa-arrow-right ml-1 group-hover:translate-x-1 transition-transform"></i>
            </a>
        </div>

        <div class="stat-card bg-white rounded-2xl shadow-lg p-6 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1 slide-in" style="animation-delay: 0.3s">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-gray-500 text-sm font-semibold uppercase tracking-wide">Payments</p>
                    <p class="text-4xl font-bold bg-gradient-to-r from-purple-600 to-purple-400 bg-clip-text text-transparent mt-2">-</p>
                </div>
                <div class="bg-gradient-to-br from-purple-400 to-purple-600 p-4 rounded-2xl shadow-lg">
                    <i class="fas fa-credit-card text-white text-3xl"></i>
                </div>
            </div>
            <a href="/payments/my" class="text-purple-600 text-sm font-bold mt-4 inline-flex items-center hover:gap-2 transition-all group">
                View Payments
                <i class="fas fa-arrow-right ml-1 group-hover:translate-x-1 transition-transform"></i>
            </a>
        </div>

        <div class="stat-card bg-white rounded-2xl shadow-lg p-6 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-1 slide-in" style="animation-delay: 0.4s">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-gray-500 text-sm font-semibold uppercase tracking-wide">Refunds</p>
                    <p class="text-4xl font-bold bg-gradient-to-r from-orange-600 to-orange-400 bg-clip-text text-transparent mt-2">-</p>
                </div>
                <div class="bg-gradient-to-br from-orange-400 to-orange-600 p-4 rounded-2xl shadow-lg">
                    <i class="fas fa-undo text-white text-3xl"></i>
                </div>
            </div>
            <a href="/refunds/my" class="text-orange-600 text-sm font-bold mt-4 inline-flex items-center hover:gap-2 transition-all group">
                View Refunds
                <i class="fas fa-arrow-right ml-1 group-hover:translate-x-1 transition-transform"></i>
            </a>
        </div>
    </div>

    <!-- Main Actions Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">

        <!-- Browse Products -->
        <div class="action-card bg-white rounded-2xl shadow-xl overflow-hidden slide-in" style="animation-delay: 0.5s">
            <div class="h-44 bg-gradient-to-br from-green-400 via-green-500 to-green-600 flex items-center justify-center relative overflow-hidden">
                <div class="absolute inset-0 bg-white opacity-10"></div>
                <div class="icon-wrapper">
                    <i class="fas fa-apple-alt text-white text-6xl drop-shadow-2xl"></i>
                </div>
            </div>
            <div class="p-6">
                <h3 class="text-2xl font-bold text-gray-800 mb-2">Browse Products</h3>
                <p class="text-gray-600 text-sm mb-5 leading-relaxed">Explore our delicious food items and place an order</p>
                <a href="/products/user/list" class="inline-flex items-center px-5 py-2.5 bg-gradient-to-r from-green-500 to-green-600 text-white rounded-xl hover:from-green-600 hover:to-green-700 transition shadow-lg hover:shadow-xl transform hover:scale-105 font-semibold">
                    Shop Now
                    <i class="fas fa-arrow-right ml-2"></i>
                </a>
            </div>
        </div>

        <!-- View Cart -->
        <div class="action-card bg-white rounded-2xl shadow-xl overflow-hidden slide-in" style="animation-delay: 0.6s">
            <div class="h-44 bg-gradient-to-br from-blue-400 via-blue-500 to-blue-600 flex items-center justify-center relative overflow-hidden">
                <div class="absolute inset-0 bg-white opacity-10"></div>
                <div class="icon-wrapper">
                    <i class="fas fa-shopping-cart text-white text-6xl drop-shadow-2xl"></i>
                </div>
            </div>
            <div class="p-6">
                <h3 class="text-2xl font-bold text-gray-800 mb-2">Your Cart</h3>
                <p class="text-gray-600 text-sm mb-5 leading-relaxed">Review items in your cart and proceed to checkout</p>
                <a href="/cart" class="inline-flex items-center px-5 py-2.5 bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-xl hover:from-blue-600 hover:to-blue-700 transition shadow-lg hover:shadow-xl transform hover:scale-105 font-semibold">
                    Open Cart
                    <i class="fas fa-arrow-right ml-2"></i>
                </a>
            </div>
        </div>

        <!-- My Orders -->
        <div class="action-card bg-white rounded-2xl shadow-xl overflow-hidden slide-in" style="animation-delay: 0.7s">
            <div class="h-44 bg-gradient-to-br from-purple-400 via-purple-500 to-purple-600 flex items-center justify-center relative overflow-hidden">
                <div class="absolute inset-0 bg-white opacity-10"></div>
                <div class="icon-wrapper">
                    <i class="fas fa-list text-white text-6xl drop-shadow-2xl"></i>
                </div>
            </div>
            <div class="p-6">
                <h3 class="text-2xl font-bold text-gray-800 mb-2">My Orders</h3>
                <p class="text-gray-600 text-sm mb-5 leading-relaxed">Track and manage all your orders in one place</p>
                <a href="/orders" class="inline-flex items-center px-5 py-2.5 bg-gradient-to-r from-purple-500 to-purple-600 text-white rounded-xl hover:from-purple-600 hover:to-purple-700 transition shadow-lg hover:shadow-xl transform hover:scale-105 font-semibold">
                    View Orders
                    <i class="fas fa-arrow-right ml-2"></i>
                </a>
            </div>
        </div>

        <!-- Payments History -->
        <div class="action-card bg-white rounded-2xl shadow-xl overflow-hidden slide-in" style="animation-delay: 0.8s">
            <div class="h-44 bg-gradient-to-br from-yellow-400 via-yellow-500 to-yellow-600 flex items-center justify-center relative overflow-hidden">
                <div class="absolute inset-0 bg-white opacity-10"></div>
                <div class="icon-wrapper">
                    <i class="fas fa-wallet text-white text-6xl drop-shadow-2xl"></i>
                </div>
            </div>
            <div class="p-6">
                <h3 class="text-2xl font-bold text-gray-800 mb-2">Payments</h3>
                <p class="text-gray-600 text-sm mb-5 leading-relaxed">View your payment history and transaction details</p>
                <a href="/payments/my" class="inline-flex items-center px-5 py-2.5 bg-gradient-to-r from-yellow-500 to-yellow-600 text-white rounded-xl hover:from-yellow-600 hover:to-yellow-700 transition shadow-lg hover:shadow-xl transform hover:scale-105 font-semibold">
                    View Payments
                    <i class="fas fa-arrow-right ml-2"></i>
                </a>
            </div>
        </div>

        <!-- Refund Requests -->
        <div class="action-card bg-white rounded-2xl shadow-xl overflow-hidden slide-in" style="animation-delay: 0.9s">
            <div class="h-44 bg-gradient-to-br from-orange-400 via-orange-500 to-orange-600 flex items-center justify-center relative overflow-hidden">
                <div class="absolute inset-0 bg-white opacity-10"></div>
                <div class="icon-wrapper">
                    <i class="fas fa-undo-alt text-white text-6xl drop-shadow-2xl"></i>
                </div>
            </div>
            <div class="p-6">
                <h3 class="text-2xl font-bold text-gray-800 mb-2">Refund Requests</h3>
                <p class="text-gray-600 text-sm mb-5 leading-relaxed">Check the status of your refund requests</p>
                <a href="/refunds/my" class="inline-flex items-center px-5 py-2.5 bg-gradient-to-r from-orange-500 to-orange-600 text-white rounded-xl hover:from-orange-600 hover:to-orange-700 transition shadow-lg hover:shadow-xl transform hover:scale-105 font-semibold">
                    View Refunds
                    <i class="fas fa-arrow-right ml-2"></i>
                </a>
            </div>
        </div>

        <!-- Profile Settings -->
        <div class="action-card bg-white rounded-2xl shadow-xl overflow-hidden slide-in" style="animation-delay: 1s">
            <div class="h-44 bg-gradient-to-br from-red-400 via-red-500 to-red-600 flex items-center justify-center relative overflow-hidden">
                <div class="absolute inset-0 bg-white opacity-10"></div>
                <div class="icon-wrapper">
                    <i class="fas fa-user-cog text-white text-6xl drop-shadow-2xl"></i>
                </div>
            </div>
            <div class="p-6">
                <h3 class="text-2xl font-bold text-gray-800 mb-2">Profile</h3>
                <p class="text-gray-600 text-sm mb-5 leading-relaxed">Manage your account settings and profile information</p>
                <a href="/profile" class="inline-flex items-center px-5 py-2.5 bg-gradient-to-r from-red-500 to-red-600 text-white rounded-xl hover:from-red-600 hover:to-red-700 transition shadow-lg hover:shadow-xl transform hover:scale-105 font-semibold">
                    Edit Profile
                    <i class="fas fa-arrow-right ml-2"></i>
                </a>
            </div>
        </div>

    </div>

    <!-- Additional Information Section -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

        <!-- Recent Activity -->
        <div class="bg-white rounded-2xl shadow-xl p-7 slide-in" style="animation-delay: 1.1s">
            <h3 class="text-2xl font-bold text-gray-800 mb-5 flex items-center">
                <div class="bg-gradient-to-br from-blue-400 to-blue-600 p-2.5 rounded-xl mr-3 shadow-lg">
                    <i class="fas fa-history text-white text-lg"></i>
                </div>
                Recent Activity
            </h3>
            <div class="space-y-3 bg-gray-50 rounded-xl p-6">
                <div class="text-center py-4">
                    <i class="fas fa-inbox text-gray-300 text-5xl mb-3"></i>
                    <p class="text-gray-600 text-sm font-medium">No recent activity yet</p>
                    <p class="text-gray-400 text-xs mt-1">Start shopping to see your activity here</p>
                </div>
            </div>
        </div>

        <!-- Help & Support -->
        <div class="bg-white rounded-2xl shadow-xl p-7 slide-in" style="animation-delay: 1.2s">
            <h3 class="text-2xl font-bold text-gray-800 mb-5 flex items-center">
                <div class="bg-gradient-to-br from-green-400 to-green-600 p-2.5 rounded-xl mr-3 shadow-lg">
                    <i class="fas fa-headset text-white text-lg"></i>
                </div>
                Help & Support
            </h3>
            <div class="space-y-4">
                <a href="/feedbacks/new" class="flex items-center p-4 bg-gradient-to-r from-blue-50 to-purple-50 rounded-xl hover:shadow-md transition group">
                    <div class="bg-white p-3 rounded-lg shadow-sm group-hover:shadow-md transition">
                        <i class="fas fa-comment text-blue-600 text-xl"></i>
                    </div>
                    <div class="ml-4">
                        <p class="text-gray-800 font-semibold">Send Feedback</p>
                        <p class="text-gray-500 text-xs">Share your thoughts with us</p>
                    </div>
                    <i class="fas fa-arrow-right ml-auto text-gray-400 group-hover:text-blue-600 group-hover:translate-x-1 transition"></i>
                </a>

            </div>
        </div>

    </div>

</div>



<script>
    document.getElementById("logoutBtn").addEventListener("click", async () => {
        if (confirm("Are you sure you want to logout?")) {
            try {
                const response = await fetch('/api/auth/logout', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' }
                });

                if (response.ok) {
                    window.location.href = '/login';
                } else {
                    alert('Logout failed!');
                }
            } catch (error) {
                console.error('Logout error:', error);
                alert('Logout failed!');
            }
        }
    });
</script>

</body>
<%@ include file="footer.jsp" %>
</html>